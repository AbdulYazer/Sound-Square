import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:soundsquare/Screens/Get_Started_section/get_started_page.dart';
import 'package:soundsquare/Screens/Get_Started_section/signin_page.dart';
import 'package:soundsquare/Screens/Home/home.dart';
import 'package:soundsquare/Services/database.dart';
import 'package:soundsquare/application/all_products/all_products_bloc.dart';
import 'package:soundsquare/application/wishlist/wishlist_bloc.dart';
import '../../constants/constants.dart';
import '../Home/speaker_details_page.dart';
import 'shipping_page.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final uId = FirebaseAuth.instance.currentUser;
      if (uId != null) {
        BlocProvider.of<AllProductsBloc>(context)
            .add(FetchAllProductsInCart(uId: uId.uid));
        BlocProvider.of<WishlistBloc>(context)
            .add(FetchUserAddress(uId: uId.uid));
      }
    });
    final uId = FirebaseAuth.instance.currentUser;
    return BlocBuilder<AllProductsBloc, AllProductsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('CART'),
            centerTitle: true,
            elevation: 0,
            leading: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          // appBar: appbar('MY CART', Icons.more_vert),
          body: BlocBuilder<AllProductsBloc, AllProductsState>(
            builder: (context, state) {
              // if (uId == null) {
              //   return Center(
              //       child: Text(
              //     'Login first!',
              //     style: centerText,
              //   ));
              // }
              if (state.allProductsInCartList == null && uId != null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.allProductsInCartList == null && uId == null) {
                return Container();
              }
              if (state.allProductsInCartList!.isEmpty) {
                return const NoProductsInCartIndicator();
              }
              // }

              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 170),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SpeakerDetailsScreen(
                                    name: state.allProductsInCartList![index]
                                        ['name'],
                                    category:
                                        state.allProductsInCartList![index]
                                            ['category'],
                                    price: state.allProductsInCartList![index]
                                        ['price'],
                                    imgUrl: state.allProductsInCartList![index]
                                        ['imgUrl'],
                                    description:
                                        state.allProductsInCartList![index]
                                            ['description'],
                                    brand: state.allProductsInCartList![index]
                                        ['brand'],
                                    prodId: state.allProductsInCartList![index]
                                        ['id'],
                                    quantity:
                                        state.allProductsInCartList![index]
                                            ['quantity'],
                                    stock: state.allProductsInCartList![index]
                                        ['stock'],
                                    subCategory:
                                        state.allProductsInCartList![index]
                                            ['subCategory'],
                                    index: index,
                                  )));
                        },
                        // child: ListTile(title: state.allProductsInCartList![index]['name'],)
                        child: cartCard(
                          imgUrl: state.allProductsInCartList![index]['imgUrl'],
                          name: state.allProductsInCartList![index]['name'],
                          price: state.allProductsInCartList![index]['price'],
                          widget: QuantityChanger(
                            index: index,
                          ),
                          icon: IconButton(
                              onPressed: () async {
                                showAlertDialog1(
                                  context,
                                  id: state.allProductsInCartList![index]['id'],
                                  uId: uId,
                                );
                              },
                              icon: const Icon(Icons.delete)),
                        ));
                  },
                  itemCount: state.allProductsInCartList!.length,
                ),
              );
            },
          ),
          bottomSheet: BlocBuilder<AllProductsBloc, AllProductsState>(
            builder: (context, state) {
              // if (state.allProductsInCartList!.isEmpty) {

              // }
              if (uId == null) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInScreen()));
                        },
                        style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            side: const BorderSide(color: Colors.grey)),
                        child: Text(
                          'Login first',
                          style: centerText,
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (state.allProductsInCartList == null && uId != null) {
                return const NoProductsInCartIndicator();
              }
              return Visibility(
                  visible:
                      uId != null && state.allProductsInCartList!.isNotEmpty,
                  child: const CheckoutBottomSheet());
              // else{
              //
              // }
            },
          ),
        );
      },
    );
  }
}

class NoProductsInCartIndicator extends StatelessWidget {
  const NoProductsInCartIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.network('https://assets9.lottiefiles.com/temp/lf20_W5bxHx.json',
            height: 250, width: 250, fit: BoxFit.contain),
        const Center(
            child: Text(
          'Add something to the cart!',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        )),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Home()));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 135, 199, 207)),
          child: const Text('Continue shopping'),
        )
      ],
    );
  }
}

class CheckoutBottomSheet extends StatelessWidget {
  const CheckoutBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int total = calculateTotal();
    final uId = FirebaseAuth.instance.currentUser;
    if (uId != null) {
      BlocProvider.of<AllProductsBloc>(context).add(TotalPrice(uId: uId.uid));
    }
    return Container(
      height: 170,
      child: Column(
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Price : '),
                    BlocBuilder<AllProductsBloc, AllProductsState>(
                      builder: (context, state) {
                        return Text(
                          '₹${state.total}',
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Shipping Charge : '),
                    Text(
                      '₹60',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total : '),
                    BlocBuilder<AllProductsBloc, AllProductsState>(
                      builder: (context, state) {
                        int total = state.total + 60;
                        return Text(
                          '₹$total',
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextIconButton(
                  text: 'CHECKOUT',
                  color: mainYlClr,
                  ontap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ShippingScreen()));
                  },
                  icon: Icons.arrow_right_alt,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

AppBar appbar(String text) {
  return AppBar(
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.black),
    centerTitle: true,
    title: Text(
      text,
      style: const TextStyle(color: Colors.black, fontSize: 16),
    ),
    // actions: [
    //   icon1!
    // ],
  );
}

Padding cartCard(
    {required String imgUrl,
    required String name,
    required String price,
    required Widget icon,
    Widget? widget}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
    child: Card(
      elevation: 0,
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.network(
              imgUrl,
              fit: BoxFit.contain,
              height: 90,
              width: 90,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 20,
                    width: 155,
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // SizedBox(width: 30,),
                  icon
                ],
              ),
              Text('₹$price'),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: widget,
              )
            ],
          )
        ],
      ),
    ),
  );
}

class QuantityChanger extends StatelessWidget {
  const QuantityChanger({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    var uId = FirebaseAuth.instance.currentUser;
    return BlocBuilder<AllProductsBloc, AllProductsState>(
      builder: (context, state) {
        int prodQuantity = 0;
        return Row(
          children: [
            IconButton(
                onPressed: () {
                  if (uId != null &&
                      int.parse(
                              state.allProductsInCartList![index]['quantity']) >
                          1) {
                    int quantity = int.parse(
                            state.allProductsInCartList![index]['quantity']) -
                        1;
                    BlocProvider.of<AllProductsBloc>(context).add(
                        UpdateQuantity(
                            quantity: quantity.toString(),
                            id: state.allProductsInCartList![index]['id'],
                            uId: uId.uid));
                    BlocProvider.of<AllProductsBloc>(context)
                        .add(FetchAllProductsInCart(uId: uId.uid));
                    BlocProvider.of<AllProductsBloc>(context)
                        .add(TotalPrice(uId: uId.uid));
                  }
                },
                icon: int.parse(
                            state.allProductsInCartList![index]['quantity']) !=
                        1
                    ? const Icon(
                        Icons.remove,
                        size: 20,
                      )
                    : const Icon(
                        Icons.remove,
                        color: Colors.grey,
                        size: 20,
                      )),
            Container(
              height: 25,
              width: 32,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child:
                  Center(child: BlocBuilder<AllProductsBloc, AllProductsState>(
                builder: (context, state) {
                  return Text(state.allProductsInCartList![index]['quantity']);
                },
              )),
            ),
            IconButton(
                onPressed: () {
                  BlocProvider.of<AllProductsBloc>(context)
                      .add(const FetchAllProducts());

                  for (int i = 0; i < state.allProductsList!.length; i++) {
                    if (state.allProductsList![i]['name'] ==
                        state.allProductsInCartList![index]['name']) {
                      prodQuantity =
                          int.parse(state.allProductsList![i]['quantity']);
                    }
                  }
                  if (uId != null &&
                      int.parse(
                              state.allProductsInCartList![index]['quantity']) <
                          prodQuantity) {
                    int quantity = int.parse(
                            state.allProductsInCartList![index]['quantity']) +
                        1;
                    BlocProvider.of<AllProductsBloc>(context).add(
                        UpdateQuantity(
                            quantity: quantity.toString(),
                            id: state.allProductsInCartList![index]['id'],
                            uId: uId.uid));
                    BlocProvider.of<AllProductsBloc>(context)
                        .add(FetchAllProductsInCart(uId: uId.uid));
                    BlocProvider.of<AllProductsBloc>(context)
                        .add(TotalPrice(uId: uId.uid));
                  }
                },
                icon: const Icon(
                  Icons.add,
                  size: 20,
                )),
          ],
        );
      },
    );
  }
}

showAlertDialog1(BuildContext context, {required uId, required String id}) {
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
      await DatabaseServices().deleteProductFromCart(uId: uId.uid, id: id);
      BlocProvider.of<AllProductsBloc>(context)
          .add(FetchAllProductsInCart(uId: uId.uid));
      BlocProvider.of<AllProductsBloc>(context).add(TotalPrice(uId: uId.uid));
      Navigator.pop(context);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Delete Product"),
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
