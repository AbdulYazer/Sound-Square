import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundsquare/Screens/Cart%20Page/cart_page.dart';
import 'package:soundsquare/Screens/Home/speakers_page.dart';
import '../../../application/wishlist/wishlist_bloc.dart';
import '../../../constants/constants.dart';
import '../speaker_details_page.dart';

class WhishlistScreen extends StatefulWidget {
  const WhishlistScreen({super.key});

  @override
  State<WhishlistScreen> createState() => _WhishlistScreenState();
}

class _WhishlistScreenState extends State<WhishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar('MY WHISHLIST'),
        body: BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            var uId = FirebaseAuth.instance.currentUser;
            var productList = state.allProductsInWishlist;
            // if (productList == []) {
            //   return Center(
            //     child: Text(
            //       'No products in wishlist',
            //       style: centerText,
            //     ),
            //   );
            // }
            if (productList.isNotEmpty) {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SpeakerDetailsScreen(
                                name: productList[index]['name'],
                                category: productList[index]['category'],
                                price: productList[index]['price'],
                                imgUrl: productList[index]['imgUrl'],
                                description: productList[index]['description'],
                                brand: productList[index]['brand'],
                                prodId: productList[index]['id'],
                                quantity: productList[index]['quantity'],
                                stock: productList[index]['stock'],
                                subCategory: productList[index]
                                    ['subCategory'], index: index,)));
                      },
                      child: cartCard(
                          imgUrl: productList[index]['imgUrl'],
                          name: productList[index]['name'],
                          price: productList[index]['price'],
                          icon: BlocBuilder<WishlistBloc, WishlistState>(
                            builder: (context, state) {
                              var wishlistedProductsList =
                                  state.allProductsInWishlist;
                              bool isWishlisted = false;
                              if (wishlistedProductsList != []) {
                                for (int i = 0;
                                    i < wishlistedProductsList.length;
                                    i++) {
                                  if (wishlistedProductsList[i]['name'] ==
                                      productList[index]['name']) {
                                    isWishlisted = true;
                                  }
                                }
                              }
                              return wishlistBtn(context, isWishlisted: isWishlisted, uId: uId, productList: productList, index: index);
                            },
                          )));
                },
                itemCount: productList.length,
              );
            }
            return Center(
              child: Text(
                'No products in wishlist',
                style: centerText,
              ),
            );
          },
        ));
  }
}