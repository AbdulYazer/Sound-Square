import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/all_products/all_products_bloc.dart';
import '../../application/wishlist/wishlist_bloc.dart';
import '../Home/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Timer goToHome(BuildContext context) {
    return Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) =>  Home()),
      ),
    );
  }
  

  void fetchAllData(BuildContext context) async {
    BlocProvider.of<AllProductsBloc>(context).add(const FetchAllProducts());
    BlocProvider.of<WishlistBloc>(context).add(const SearchedSong(query: ''));
    var uId = FirebaseAuth.instance.currentUser;
    if (uId != null) {
      BlocProvider.of<AllProductsBloc>(context)
          .add(FetchAllProductsInCart(uId: uId.uid));
      BlocProvider.of<AllProductsBloc>(context)
          .add(FetchUserDetails(uId: uId.uid));
    }
    
  }

  @override
  Widget build(BuildContext context) {
    fetchAllData(context);
    goToHome(context);
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.zero,
              height: 450,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/splashlogo3.png',
                      ),
                      fit: BoxFit.fitHeight)),
            ),
          ),
          const Positioned(
            bottom: 200,
            left: 80,
            child: Text(
              'Sound Square',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.black),
            ),
          ),
      ]
      )
    );
  }
}
