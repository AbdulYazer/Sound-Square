import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:soundsquare/Screens/Cart%20Page/cart_page.dart';
import 'package:soundsquare/Screens/Home/home.dart';
import 'package:soundsquare/Screens/Home/speakers_page.dart';
import 'package:soundsquare/constants/constants.dart';
import 'package:soundsquare/constants/motion_toast.dart';
import '../../application/all_products/all_products_bloc.dart';
import '../../application/wishlist/wishlist_bloc.dart';

class SpeakerDetailsScreen extends StatefulWidget {
  const SpeakerDetailsScreen(
      {super.key,
      required this.name,
      required this.category,
      required this.price,
      required this.imgUrl,
      required this.description,
      required this.prodId,
      required this.brand,
      required this.quantity,
      required this.subCategory,
      required this.stock,
      required this.index});
  final String prodId;
  final String name;
  final String category;
  final String price;
  final String imgUrl;
  final String description;
  final String brand;
  final String quantity;
  final String subCategory;
  final String stock;
  final int index;
  @override
  State<SpeakerDetailsScreen> createState() => _SpeakerDetailsScreenState();
}

class _SpeakerDetailsScreenState extends State<SpeakerDetailsScreen> {
  bool isWishlisted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: InkWell(
              onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Home(index: 2,))),
                child: shoppingCartWithCount(context, Colors.transparent)),
          ),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.category,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'From',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '₹${widget.price}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  BlocBuilder<WishlistBloc, WishlistState>(
                    builder: (context, state) {
                      var uId = FirebaseAuth.instance.currentUser;
                      var wishlistedProductsList = state.allProductsInWishlist;
                      isWishlisted = false;
                      if (wishlistedProductsList != null) {
                        for (int i = 0;
                            i < wishlistedProductsList.length;
                            i++) {
                          if (wishlistedProductsList[i]['name'] ==
                              widget.name) {
                            isWishlisted = true;
                          }
                        }
                      }
                      return BlocBuilder<AllProductsBloc, AllProductsState>(
                        builder: (context, state) {
                          var allProductsList = state.allProductsList;
                          return uId != null ? wishlistBtn(context,
                              isWishlisted: isWishlisted,
                              uId: uId,
                              productList: allProductsList!,
                              index: widget.index) : Icon(Icons.favorite_border,color: Colors.grey[400],);
                        },
                      );
                    },
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 380,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Text(
                        widget.name,
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.description,
                        style:
                            const TextStyle(color: Colors.black54, height: 1.3),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      AddToCartBtn(
                          prodId: widget.prodId,
                          name: widget.name,
                          category: widget.category,
                          price: widget.price,
                          imgUrl: widget.imgUrl,
                          description: widget.description,
                          brand: widget.brand,
                          quantity: widget.quantity,
                          subCategory: widget.subCategory,
                          stock: widget.stock),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 120,
                left: 120,
                child: Image(
                  image: NetworkImage(widget.imgUrl),
                  height: 300,
                  width: 300,
                  fit: BoxFit.contain,
                )
                // Container(
                //   height: 350,
                //   width: 300,
                //   decoration: BoxDecoration(
                //       // color: Colors.amberAccent,
                //       image: DecorationImage(
                //           image: NetworkImage(widget.imgUrl),

                //           fit: BoxFit.contain)),
                // ),
                ),
          ],
        ),
      ),
    );
  }
}

class AddToCartBtn extends StatelessWidget {
  const AddToCartBtn({
    super.key,
    required this.prodId,
    required this.name,
    required this.category,
    required this.price,
    required this.imgUrl,
    required this.description,
    required this.brand,
    required this.quantity,
    required this.subCategory,
    required this.stock,
  });
  final String prodId;
  final String name;
  final String category;
  final String price;
  final String imgUrl;
  final String description;
  final String brand;
  final String quantity;
  final String subCategory;
  final String stock;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductsBloc, AllProductsState>(
      builder: (context, state) {
        FirebaseAuth auth = FirebaseAuth.instance;
        final userId = auth.currentUser;
        return TextButton(
            style: TextButton.styleFrom(
                backgroundColor: mainYlClr,
                minimumSize: const Size(double.infinity, 40)),
            onPressed: () {
              if(userId == null){
                motionToastCustom(context, 'Login First!',
                              'https://assets10.lottiefiles.com/packages/lf20_QKRDTQ.json');
              }else{
                BlocProvider.of<AllProductsBloc>(context)
                  .add(FetchAllProductsInCart(uId: userId!.uid));
              bool isAdded = false;
              for (int i = 0; i < state.allProductsInCartList!.length; i++) {
                if (state.allProductsInCartList![i]['id'] == prodId) {
                  isAdded = true;
                }
              }
              if (state.allProductsInCartList == null || !isAdded) {
                BlocProvider.of<AllProductsBloc>(context).add(AddToCart(
                    uId: userId.uid,
                    name: name,
                    brand: brand,
                    price: price,
                    quantity: '1',
                    category: category,
                    stock: stock,
                    description: description,
                    subCategory: subCategory,
                    imgUrl: imgUrl,
                    id: prodId));
                MotionToast(
                  height: 130,
                  width: 200,
                  toastDuration: const Duration(seconds: 2),
                  position: MotionToastPosition.center,
                  primaryColor: mainYlClr,
                  description: Center(
                    child: Column(
                      children: [
                        Lottie.network(
                            'https://assets1.lottiefiles.com/private_files/lf30_yo2zavgg.json',
                            height: 70,
                            width: 70,
                            fit: BoxFit.contain),
                        const Text(
                          'ADDED TO CART \nSUCCESSFULLY',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ).show(context);
              } else {
                motionToastCustom(context, 'Product is already in cart',
                    'https://assets10.lottiefiles.com/packages/lf20_QKRDTQ.json');
              }
              }
              
            },
            child: const Text(
              'ADD TO CART',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ));
      },
    );
  }
}
