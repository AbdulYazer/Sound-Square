import 'package:flutter/material.dart';
import 'package:soundsquare/Screens/Cart%20Page/cart_page.dart';

import '../../constants/constants.dart';
import '../Home/home.dart';

class OrderReviewScreen extends StatelessWidget {
  const OrderReviewScreen({super.key, required this.addressId});
  final String addressId;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 2), () {
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                                builder: (context) => Home()),((route) => false));
                          });
    });
    return Scaffold(
      appBar: appbar('ORDER REVIEW'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: mainYlClr,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.credit_score_outlined,
                size: 55,
              ),
            ),
          ),
          const SizedBox(height: 30,),
          const Text('Order Successful!',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
        //   ElevatedButton(
        //   onPressed: () {
        //     Navigator.of(context).pushReplacement(
        //         MaterialPageRoute(builder: (context) =>  Home()));
        //   },
        //   style: ElevatedButton.styleFrom(
        //       backgroundColor: const Color.fromARGB(255, 135, 199, 207)),
        //   child: const Text('Continue shopping'),
        // )
        ],
      ),
    );
  }
}
