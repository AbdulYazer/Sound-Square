import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundsquare/Screens/Cart%20Page/cart_page.dart';
import 'package:soundsquare/Screens/Home/speaker_details_page.dart';
import 'package:soundsquare/constants/constants.dart';

import '../../application/all_products/all_products_bloc.dart';
import '../../application/wishlist/wishlist_bloc.dart';

class SpeakersScreen extends StatefulWidget {
  const SpeakersScreen({super.key, required this.category});
  final String category;
  @override
  State<SpeakersScreen> createState() => _SpeakersScreenState();
}

class _SpeakersScreenState extends State<SpeakersScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(widget.category),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // newSpeakersCard(context),
            const SpeakersCarousel(),
            SizedBox(
              height: 50,
              child: AppBar(
                elevation: 0,
                bottom: const TabBar(
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.black,
                  labelPadding: EdgeInsets.symmetric(horizontal: 30),
                  labelColor: Colors.black,
                  tabs: [
                    Tab(
                      text: ('View all'),
                    ),
                    Tab(
                      text: ('Wired'),
                    ),
                    Tab(
                      text: ('Wireless'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            productsTabBar(),
          ],
        ),
      ),
    );
  }
}

Widget newSpeakersCard(
  BuildContext context, {
  required String imgUrl,
  required String name,
  required String price,
  required String description,
  required String category,
  required String brand,
  required String stock,
  required String subCategory,
  required String quantity,
  required String prodId,
  required int index
}) {
  final width = MediaQuery.of(context).size.width;
  return Container(
    margin: const EdgeInsets.all(20),
    // color: Colors.green,
    // height: 300,
    // width: width * 0.8,
    child: Stack(
      children: [
        Positioned(
          top: 100,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                  topLeft: Radius.elliptical(250, 80),
                  topRight: Radius.circular(40)),
            ),
            height: 230,
            width: width * .9,
          ),
        ),
        Positioned(
            bottom: 58,
            left: 50,
            child: InkWell(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SpeakerDetailsScreen()));
              },
              child: speaker(context,
                  imgUrl: imgUrl,
                  name: name,
                  category: category,
                  description: description,
                  price: price,
                  brand: brand,
                  prodId: prodId,
                  quantity: quantity,
                  stock: stock,
                  subCategory: subCategory, index: index),
            ))
      ],
    ),
  );
}

productsTabBar() {
  return BlocBuilder<AllProductsBloc, AllProductsState>(
    builder: (context, state) {
      return Expanded(
        child: TabBarView(
          children: [
            AllProducts(
              products: state.allSpeakersList,
            ),
            AllProducts(
              products: state.allWiredSpeakersList,
            ),
            AllProducts(
              products: state.allWirelessSpeakersList,
            ),
          ],
        ),
      );
    },
  );
}

class AllProducts extends StatefulWidget {
  AllProducts({super.key, required this.products});
  List<dynamic>? products;
  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductsBloc, AllProductsState>(
      builder: (context, state) {
        var uId = FirebaseAuth.instance.currentUser;
        var productList = widget.products;
        if (productList == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
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
                          subCategory: productList[index]['subCategory'], index: index,)));
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
                        if (wishlistedProductsList != null) {
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
      },
    );
  }
}

class SpeakersCarousel extends StatefulWidget {
  const SpeakersCarousel({super.key});

  @override
  State<SpeakersCarousel> createState() => _SpeakersCarouselState();
}

class _SpeakersCarouselState extends State<SpeakersCarousel> {
  int pageIdx = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    List<Widget> carouselPages = [];
    return BlocBuilder<AllProductsBloc, AllProductsState>(
      builder: (context, state) {
        if (state.allSpeakersList == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Stack(
          children: [
            Container(
              // color: Colors.greenAccent,
              height: 370,
              width: width * 1,
              child: PageView(
                onPageChanged: ((index) {
                  setState(() {
                    pageIdx = index;
                  });
                }),
                children: carouselPages = List.generate(3, (index) {
                  return newSpeakersCard(context,
                      imgUrl: state.allSpeakersList![index]['imgUrl'],
                      name: state.allSpeakersList![index]['name'],
                      category: state.allSpeakersList![index]['category'],
                      description: state.allSpeakersList![index]['description'],
                      price: state.allSpeakersList![index]['price'],
                      brand: state.allSpeakersList![index]['brand'],
                      prodId: state.allSpeakersList![index]['id'],
                      quantity: state.allSpeakersList![index]['quantity'],
                      stock: state.allSpeakersList![index]['stock'],
                      subCategory: state.allSpeakersList![index]['subCategory'], index: index);
                })
              ),
            ),
            Positioned(
                top: 310,
                left: 160,
                child: DotsIndicator(
                  position: pageIdx.toDouble(),
                  dotsCount: carouselPages.length,
                  decorator: DotsDecorator(
                    activeColor: Colors.black,
                    size: const Size(8, 5),
                    activeSize: const Size(17, 5),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  onTap: (index) {
                    setState(() {
                      pageIdx = index.toInt();
                    });
                  },
                )),
            const SizedBox(
              height: 20,
            )
          ],
        );
      },
    );
  }
}

InkWell speaker(
  BuildContext context, {
  required String imgUrl,
  required String name,
  required String price,
  required String category,
  required String description,
  required String brand,
  required String stock,
  required String subCategory,
  required String quantity,
  required String prodId,
  required int index
}) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SpeakerDetailsScreen(
                name: name,
                category: category,
                price: price,
                imgUrl: imgUrl,
                description: description,
                brand: brand,
                prodId: prodId,
                quantity: quantity,
                stock: stock,
                subCategory: subCategory, index: index,
              )));
    },
    child: Column(
      children: [
        Image(
          image: NetworkImage(imgUrl),
          height: 200,
          width: 230,
          fit: BoxFit.contain,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Innovative, wireless home speaker',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

IconButton wishlistBtn(BuildContext context,
    {required bool isWishlisted,
    required uId,
    required List<dynamic> productList,
    required int index}) {
  return isWishlisted
      ? IconButton(
          onPressed: () async {
            if (uId != null) {
              BlocProvider.of<WishlistBloc>(context).add(RemoveFromWishlist(
                  uId: uId.uid, id: productList[index]['id']));
              BlocProvider.of<WishlistBloc>(context)
                  .add(FetchAllWhislistedProducts(uId: uId.uid));
            }
            const snackBar = SnackBar(
              content: Text('Item removed from wishlist!'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          icon: Icon(
            Icons.favorite,
            color: mainYlClr,
          ),
        )
      : IconButton(
          onPressed: () {
            if (uId != null) {
              BlocProvider.of<WishlistBloc>(context).add(AddToWishlist(
                  uId: uId.uid,
                  name: productList[index]['name'],
                  category: productList[index]['category'],
                  price: productList[index]['price'],
                  imgUrl: productList[index]['imgUrl'],
                  description: productList[index]['description'],
                  brand: productList[index]['brand'],
                  id: productList[index]['id'],
                  quantity: productList[index]['quantity'],
                  stock: productList[index]['stock'],
                  subCategory: productList[index]['subCategory']));
              BlocProvider.of<WishlistBloc>(context)
                  .add(FetchAllWhislistedProducts(uId: uId.uid));
              const snackBar = SnackBar(
                content: Text('Item added to wishlist!'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          icon: Icon(
            Icons.favorite_border,
            color: Colors.grey[400],
          ),
        );
}
