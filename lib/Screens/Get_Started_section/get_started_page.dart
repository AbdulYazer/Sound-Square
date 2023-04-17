import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundsquare/Screens/Home/home.dart';

import '../../application/all_products/all_products_bloc.dart';
import '../../application/wishlist/wishlist_bloc.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
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
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Welcome to Sound Square',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'With long experience in the audio industry,\n we create the best quality products ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1.6,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color.fromARGB(255, 122, 121, 121)),
            ),
            const SizedBox(
              height: 50,
            ),
            TextIconButton(
                text: 'GET STARTED',
                icon: Icons.arrow_right_alt,
                color: const Color.fromRGBO(255, 219, 71, 1),
                ontap: () {
                  var uId = FirebaseAuth.instance.currentUser;
                  if(uId != null){
                  BlocProvider.of<AllProductsBloc>(context).add(FetchUserDetails(uId: uId.uid));
                  BlocProvider.of<AllProductsBloc>(context).add(FetchAllProductsInCart(uId: uId.uid));
                  }
                  BlocProvider.of<AllProductsBloc>(context)
                      .add(const FetchAllProducts());
                  BlocProvider.of<WishlistBloc>(context)
                      .add(const SearchedSong(query: ''));
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) =>  Home()));
                  });
                }),
          ],
        ),
      ),
    );
  }
}

class TextIconButton extends StatelessWidget {
  const TextIconButton(
      {Key? key,
      required this.text,
      this.icon,
      required this.color,
      this.preIcon,
      required this.ontap})
      : super(key: key);
  final Widget? preIcon;
  final String text;
  final IconData? icon;
  final Color color;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 300,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: InkWell(
            onTap: ontap,
            //(() {
            //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => ontap));
            // }),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: preIcon,
                ),
                Center(
                    child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1),
                )),
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(icon),
                )
              ],
            ),
          ),
        ));
  }
}
