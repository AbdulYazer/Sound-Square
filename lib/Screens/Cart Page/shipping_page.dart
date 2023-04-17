import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundsquare/Screens/Cart%20Page/addressAddPage.dart';
import 'package:soundsquare/Screens/Cart%20Page/cart_page.dart';
import 'package:soundsquare/Screens/Cart%20Page/googlemaps.dart';
import 'package:soundsquare/constants/constants.dart';
import 'package:soundsquare/constants/motion_toast.dart';
import '../../application/all_products/all_products_bloc.dart';
import '../../application/wishlist/wishlist_bloc.dart';
import '../Get_Started_section/get_started_page.dart';
import 'payment_page.dart';

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({super.key});

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  int _value = 0;
  String addressId = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('SHIPPING'),
      body: SingleChildScrollView(
        child:
            // List Addresses  address1, address2
            SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.amber[200],
                child: GoogleMapsWidget(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Select a delivery address',
                    style: centerText,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox.fromSize(
                    size: const Size(double.infinity, 220),
                    child: BlocBuilder<WishlistBloc, WishlistState>(
                      builder: (context, state) {
                        var uId = FirebaseAuth.instance.currentUser;
                        if (uId != null) {
                          BlocProvider.of<WishlistBloc>(context)
                              .add(FetchUserAddress(uId: uId.uid));
                        }
                        List _addresses = state.userAddressList;
                        if (_addresses.isEmpty) {
                          return Center(
                            child: Text(
                              'No saved Addresses',
                              style: centerText,
                            ),
                          );
                        }
                        return ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            addressId = _addresses[state.value]['id'];
                            return ListTile(
                              leading: Radio(
                                value: index,
                                groupValue: state.value,
                                onChanged: (value) {
                                  // setState(() {
                                  //   _value = value!;
                                  // });
                                  addressId = _addresses[index]['id'];
                                  BlocProvider.of<WishlistBloc>(context)
                                      .add(RadioBtnValue(value: value));
                                  
                                },
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      '${state.userAddressList[index]['name']}'),
                                  Text(
                                      '${state.userAddressList[index]['number']}'),
                                  Text(
                                      '${state.userAddressList[index]['pincode']}'),
                                  Text(
                                      '${state.userAddressList[index]['area']}'),
                                  Text(
                                      '${state.userAddressList[index]['town']}'),
                                  Text(
                                      '${state.userAddressList[index]['state']}'),
                                  Text(
                                      '${state.userAddressList[index]['country']}'),
                                ],
                              ),
                            );
                          },
                          itemCount: state.userAddressList.length,
                          separatorBuilder: ((context, index) =>
                              const Divider()),
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(
                      'Add a New Address',
                      style: centerText2,
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      size: 30,
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddressAddScreen()));
                    },
                  ),
                  const Divider(),
                  Center(
                    child: BlocBuilder<AllProductsBloc, AllProductsState>(
                      builder: (context, state) {
                        return TextIconButton(
                          text: 'DELIVER TO THIS ADDRESS',
                          color: mainYlClr,
                          ontap: () {
                            print(addressId);
                            if (addressId != '') {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PaymentScreen(
                                        total: state.total.toString(), addressId: addressId,
                                      )));
                            }
                            if (addressId == '') {
                              return motionToastCustom(
                                  context,
                                  'Please select an address',
                                  'https://assets10.lottiefiles.com/packages/lf20_QKRDTQ.json');
                            }
                          },
                          icon: Icons.arrow_right_alt,
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
