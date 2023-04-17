import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundsquare/application/all_products/all_products_bloc.dart';
import '../../application/wishlist/wishlist_bloc.dart';
import '../../constants/constants.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({
    super.key,
    required this.orderDate,
    required this.orderId,
    required this.orderTotal,
    required this.ordersList,
    required this.index,
  });
  final String orderDate;
  final String orderId;
  final String orderTotal;
  final int index;
  final List<dynamic> ordersList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: BlocBuilder<AllProductsBloc, AllProductsState>(
              builder: (context, state) {
                return Visibility(
                  visible:
                      state.allOrdersList![index]['status'] == 'Cancelled' ? false : true,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: const Size(100, 10)),
                      onPressed: () {
                        showAlertDialogOrder(context, orderId: orderId, status: state.allOrdersList![index]['status']);
                      },
                      child: Text(
                        (state.allOrdersList![index]['status'] != 'Delivered') ? 'CANCEL' : 'RETURN',
                        style: TextStyle(color: Colors.white),
                      )),
                );
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'View order details',
              style: centerText,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10)),
              shadowColor: Colors.black,
              elevation: 0,
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('Order date   :     '),
                          Text(
                            orderDate,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Order id        :    '),
                          Text(
                            orderId,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Order total   :     '),
                          Text(
                            '₹$orderTotal',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              'Purchase details',
              style: centerText2,
            ),
            SizedBox.fromSize(
              size: const Size(double.infinity, 500),
              child: ListView(
                children: [
                  for (int i = 0;
                      i < ordersList[index]['products'].length;
                      i++) ...[
                    purchaseDetailsCard(
                        imgUrl: ordersList[index]['products'][i]['imgUrl'],
                        itemName: ordersList[index]['products'][i]['name'],
                        brand: ordersList[index]['products'][i]['brand'],
                        quantity: ordersList[index]['products'][i]['quantity'],
                        price: ordersList[index]['products'][i]['price']),
                  ]
                ],
              ),
            ),
            Text(
              'Shipping details',
              style: centerText2,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10)),
              shadowColor: Colors.black,
              elevation: 0,
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ordersList[index]['address'][0]['name'],
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        ordersList[index]['address'][0]['number'],
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        ordersList[index]['address'][0]['area'],
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        ordersList[index]['address'][0]['town'],
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        ordersList[index]['address'][0]['state'],
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        ordersList[index]['address'][0]['country'],
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        ordersList[index]['address'][0]['pincode'],
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class purchaseDetailsCard extends StatelessWidget {
  const purchaseDetailsCard({
    super.key,
    required this.imgUrl,
    required this.itemName,
    required this.brand,
    required this.quantity,
    required this.price,
  });

  final String imgUrl;
  final String itemName;
  final String brand;
  final String quantity;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10)),
      shadowColor: Colors.black,
      elevation: 0,
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Image(
                image: NetworkImage(imgUrl),
                height: 100,
                width: 100,
                fit: BoxFit.contain,
              )),
              Row(
                children: [
                  const Text('Name       :     '),
                  Text(
                    itemName,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Brand        :    '),
                  Text(
                    brand,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Quantity   :     '),
                  Text(
                    quantity,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Price         :     '),
                  Text(
                    '₹$price',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialogOrder(BuildContext context, {required String orderId,required String status}) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: const Text("ok"),
    onPressed: () async {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        BlocProvider.of<WishlistBloc>(context).add(ChangeStatus(
            status: (status != 'Delivered') ? 'Cancelled' : 'Returned', orderId: orderId, userId: user.uid));
        BlocProvider.of<AllProductsBloc>(context)
            .add(FetchOrders(uId: user.uid));
      }
      Navigator.pop(context);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text((status != 'Delivered') ? 'Cancel Order' : 'Return Order'),
    content: const Text("Are you sure ?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
