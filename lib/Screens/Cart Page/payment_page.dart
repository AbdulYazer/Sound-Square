import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:intl/intl.dart';
import 'package:soundsquare/Screens/Cart%20Page/cart_page.dart';
import 'package:soundsquare/Screens/Cart%20Page/orderreview_Page.dart';
import 'package:soundsquare/Screens/Get_Started_section/get_started_page.dart';
import 'package:soundsquare/constants/constants.dart';
import '../../application/all_products/all_products_bloc.dart';

const String keyId = 'rzp_test_ars40jMvKPCzqT';
const String keySecret = 'DYkAGNshW2WS0c5AR1vNenL5';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({super.key, this.total, required this.addressId});
  final String? total;
  final String addressId;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Do something when payment succeeds
    print(response);
    await verifySignature(
            signature: response.signature,
            paymentId: response.paymentId,
            orderId: response.orderId)
        .then((value) {
      var uId = FirebaseAuth.instance.currentUser;
      if (uId != null) {
        String totalPrice = (int.parse(widget.total!) + 60).toString();
        DateTime now = DateTime.now();
        String date = DateFormat('yMd').format(now);
        BlocProvider.of<AllProductsBloc>(context).add(AddOrders(
            uId: uId.uid,
            addressId: widget.addressId,
            date: date,
            paymentType: 'Razor Pay',
            status: 'Pending',
            totalPrice: totalPrice,
            context: context));
        log('hii1');
        BlocProvider.of<AllProductsBloc>(context)
            .add(FetchAllProductsInCart(uId: uId.uid));
        log('hii3');
      }
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => OrderReviewScreen(
                    addressId: widget.addressId,
                  )),
          ((route) => false));
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(response.message ?? '')));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(response.walletName ?? '')));
  }

  static Razorpay _razorpay = Razorpay();
  int value = 0;
  final paymentMethods = ['Pay Online', 'Cash On Delivery'];
  List<Widget> paymentLogos = [
    // Image.asset('assets/images/googlepay_logo.png'),
    // Image.asset('assets/images/applepay_logo.png'),
    Image.asset('assets/images/razorpaylogo.png'),
    Image.asset('assets/images/COD_logo.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('PAYMENT METHOD'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select a payment method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: paymentMethods.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Radio(
                      value: index,
                      groupValue: value,
                      onChanged: ((e) => setState(() => value = e!)),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.black;
                        }
                        return Colors.black;
                      }),
                    ),
                    title: Text(
                      paymentMethods[index],
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: paymentLogos[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
          height: 80,
          color: Colors.white,
          child: Center(
              child: TextIconButton(
            text: 'CONTINUE',
            color: mainYlClr,
            ontap: () async {
              if (value == 1) {
                var uId = FirebaseAuth.instance.currentUser;
                if (uId != null) {
                  String totalPrice =
                      (int.parse(widget.total!) + 60).toString();
                  DateTime now = DateTime.now();
                  String date = DateFormat('d/M/y').format(now);
                  BlocProvider.of<AllProductsBloc>(context).add(AddOrders(
                      uId: uId.uid,
                      addressId: widget.addressId,
                      date: date,
                      paymentType: 'COD',
                      status: 'Pending',
                      totalPrice: totalPrice,
                      context: context));
                  BlocProvider.of<AllProductsBloc>(context)
                      .add(FetchAllProductsInCart(uId: uId.uid));
                }
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => OrderReviewScreen(
                              addressId: widget.addressId,
                            )),
                    ((route) => false));
              } else {
                createOrder(widget.total!);
              }
            },
            icon: Icons.arrow_right_alt,
          ))),
    );
  }

  void createOrder(String total) async {
    String userName = keyId;
    String password = keySecret;
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$userName:$password'))}';
    String totalPrice = (int.parse(total) + 60).toString();
    Map<String, dynamic> body = {
      'amount': totalPrice + '00',
      'currency': 'INR',
    };
    var res = await http.post(Uri.https('api.razorpay.com', 'v1/orders'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'authorization': basicAuth
        },
        body: jsonEncode(body));
    if (res.statusCode == 200) {
      openGateway(jsonDecode(res.body)['id'], total);
    }
    print('${res.body}');
  }

  static void openGateway(String orderId, String total) {
    var options = {
      'key': keyId,
      'amount': total,
      'name': 'audible Corp.',
      'order_id': orderId,
      'description': 'Fine T-Shirt',
      'timeout': 60 * 5,
      'prefill': {'contact': '8089686212', 'email': 'yazer8353@gmail.com'}
    };
    _razorpay.open(options);
  }

  Future verifySignature(
      {String? signature, String? paymentId, String? orderId}) async {
    Map<String, dynamic> body = {
      'razorpay_signature': signature,
      'razerpay_payment_id': paymentId,
      'razerpay_order_id': orderId
    };
    var parts = [];
    body.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)} ='
          '${Uri.encodeQueryComponent(value)}');
    });

    // var formData = parts.join('&');
    // var res = await http.post(
    //     Uri.https(
    //       '10.0.2.2',
    //       'razorpay_signature_verify.php',
    //     ),
    //     headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    //     body: formData);

    // print(res.body);
    // if (res.statusCode == 200) {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text(res.body)));
    // }
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
