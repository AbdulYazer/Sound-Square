import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/all_products/all_products_bloc.dart';
import '../../../constants/constants.dart';
import '../../Cart Page/cart_page.dart';
import '../order_details.dart';

class OrdersMainScreen extends StatelessWidget {
  const OrdersMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        BlocProvider.of<AllProductsBloc>(context)
            .add(FetchOrders(uId: user.uid));
      }
    });
    return Scaffold(
      appBar: appbar('MY ORDERS'),
      body: BlocBuilder<AllProductsBloc, AllProductsState>(
        builder: (context, state) {
          var uId = FirebaseAuth.instance.currentUser;
          var ordersList = state.allOrdersList;
          if (ordersList == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (ordersList.isEmpty) {
            return Center(
              child: Text(
                'No orders',
                style: centerText,
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OrderDetailsScreen(orderDate: ordersList[index]['date'], orderId: ordersList[index]['id'], orderTotal: ordersList[index]['totalPrice'], ordersList: ordersList, index: index,)));
                },
                child: ordersCard(
                    orderId: ordersList[index]['id'],
                    date: ordersList[index]['date'],
                    totalPrice: ordersList[index]['totalPrice'],
                    paymentType: ordersList[index]['paymentType'],
                    status: ordersList[index]['status']),
                // ordersCard(
                //     imgUrl: ordersList[0]['products'][index]['imgUrl'],
                //     name: ordersList[0]['products'][index]['name'],
                //     price: ordersList[0]['products'][index]['price'],
                //     quantity: ordersList[0]['products'][index]['quantity'])
              );
            },
            itemCount: ordersList.length,
          );
        },
      ),
    );
  }

  Widget ordersCard(
      {required String orderId,
      required String date,
      required String totalPrice,
      required String paymentType,
      required String status}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      elevation: 0,
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 250,
                  child: Text(
                    orderId,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  status,
                  style: const TextStyle(color: Colors.orange, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Price :  ₹$totalPrice'),
            const SizedBox(
              height: 10,
            ),
            Text('Date : $date',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            const SizedBox(
              height: 10,
            ),
            Text('Payment Type : $paymentType',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),

      // Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 20),
      //   child: Container(
      //     height: 100,
      //     width: 90,
      //     child: Stack(
      //       children: [
      //         const Text(
      //           'shipped',
      //           style: TextStyle(color: Colors.orange, fontSize: 12),
      // ),
      // Positioned(
      //     top: 10,
      //     child: statusBtn(color: Colors.grey, text: 'Track')),
      // Positioned(
      //     top: 40,
      //     child: statusBtn(color: mainYlClr, text: 'cancel')),
      //       ],
      //     ),
      //   ),
      // )
    );
  }
}
