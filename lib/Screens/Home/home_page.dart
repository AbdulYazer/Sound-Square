import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundsquare/Screens/Get_Started_section/signin_page.dart';
import 'package:soundsquare/Screens/Home/drawer/Whishlist_Page.dart';
import 'package:soundsquare/Screens/Home/drawer/orders_page.dart';
import 'package:soundsquare/Screens/Home/drawer/privacy_policy.dart';
import 'package:soundsquare/Screens/Home/drawer/terms_and_conditions.dart';
import 'package:soundsquare/Screens/Home/speaker_details_page.dart';
import 'package:soundsquare/Screens/Home/speakers_page.dart';
import 'package:soundsquare/Services/authFunctions.dart';
import 'package:soundsquare/constants/loading.dart';
import '../../application/all_products/all_products_bloc.dart';
import '../../application/wishlist/wishlist_bloc.dart';
import 'home.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  var uId = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (uId != null) {
        BlocProvider.of<AllProductsBloc>(context).add(const FetchAllProducts());
        BlocProvider.of<AllProductsBloc>(context)
            .add(FetchUserDetails(uId: uId!.uid));
        BlocProvider.of<AllProductsBloc>(context)
            .add(FetchAllProductsInCart(uId: uId!.uid));
      }
    });
    // final user = Provider.of<Users>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        drawer: NavigationDrawer(),
        body: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Browse by Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InkWell(
                        onTap: () async {
                          BlocProvider.of<AllProductsBloc>(context)
                              .add(const FetchAllSpeakers());
                          BlocProvider.of<AllProductsBloc>(context)
                              .add(const FetchAllWirelessSpeakers());
                          BlocProvider.of<AllProductsBloc>(context)
                              .add(const FetchAllWiredSpeakers());
                          var uId = FirebaseAuth.instance.currentUser;
                          if (uId != null) {
                            BlocProvider.of<WishlistBloc>(context)
                                .add(FetchAllWhislistedProducts(uId: uId.uid));
                          }

                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SpeakersScreen(
                                      category: 'Speakers',
                                    )));
                          });
                        },
                        child: categoryCard(
                            imgUrl: 'assets/images/Speaker.png',
                            category: 'Speakers')),
                    InkWell(
                        onTap: () async {
                          BlocProvider.of<AllProductsBloc>(context)
                              .add(const FetchAllEarbuds());
                          BlocProvider.of<AllProductsBloc>(context)
                              .add(const FetchAllWirelessEarbuds());
                          BlocProvider.of<AllProductsBloc>(context)
                              .add(const FetchAllWiredEarbuds());
                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SpeakersScreen(
                                      category: 'Earbuds',
                                    )));
                          });
                        },
                        child: categoryCard(
                            imgUrl: 'assets/images/earbuds.png',
                            category: 'Earbuds')),
                    InkWell(
                      onTap: () async {
                        BlocProvider.of<AllProductsBloc>(context)
                            .add(const FetchAllHeadphones());
                        BlocProvider.of<AllProductsBloc>(context)
                            .add(const FetchAllWirelessHeadphones());
                        BlocProvider.of<AllProductsBloc>(context)
                            .add(const FetchAllWiredHeadphones());
                        Future.delayed(const Duration(seconds: 1), () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SpeakersScreen(
                                    category: 'Headphones',
                                  )));
                        });
                      },
                      child: categoryCard(
                          imgUrl: 'assets/images/headphones.png',
                          category: 'Headphones'),
                    ),
                    InkWell(
                      onTap: () async {
                        BlocProvider.of<AllProductsBloc>(context)
                            .add(const FetchAllEarphones());
                        BlocProvider.of<AllProductsBloc>(context)
                            .add(const FetchAllWirelessEarphones());
                        BlocProvider.of<AllProductsBloc>(context)
                            .add(const FetchAllWiredEarphones());
                        Future.delayed(const Duration(seconds: 1), () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SpeakersScreen(
                                    category: 'Earphones',
                                  )));
                        });
                      },
                      child: categoryCard(
                          imgUrl: 'assets/images/Wireless-Earphones.png',
                          category: 'Earphones'),
                    ),
                  ],
                )),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Recommended for You',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            BlocBuilder<AllProductsBloc, AllProductsState>(
              builder: (context, state) {
                List<dynamic>? productsList = state.allProductsList!.toList();
                productsList.shuffle();
                if (state.allProductsList == null) {
                  return const Center(
                    child: Loading(),
                  );
                }
                return GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SpeakerDetailsScreen(
                                    category: productsList[index]['category'],
                                    description: productsList[index]
                                        ['description'],
                                    imgUrl: productsList[index]['imgUrl'],
                                    name: productsList[index]['name'],
                                    price: productsList[index]['price'],
                                    brand: productsList[index]['brand'],
                                    prodId: productsList[index]['id'],
                                    quantity: productsList[index]['quantity'],
                                    stock: productsList[index]['stock'],
                                    subCategory: productsList[index]
                                        ['subCategory'],
                                    index: index,
                                  )));
                        },
                        child: recommendedCard(
                            imgUrl: productsList[index]['imgUrl'],
                            name: productsList[index]['name'],
                            price: productsList[index]['price']));
                  },
                );
              },
            ),
          ]),
        ));
  }
}

Widget categoryCard({required String imgUrl, required String category}) {
  return Container(
    margin: const EdgeInsets.all(20),
    // color: Colors.green,
    height: 250,
    width: 210,
    child: Stack(
      children: [
        Positioned(
          top: 60,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                  topLeft: Radius.elliptical(250, 80),
                  topRight: Radius.circular(50)),
            ),
            height: 180,
            width: 210,
          ),
        ),
        Positioned(
          left: 30,
          bottom: 100,
          child: Image(
            image: AssetImage(imgUrl),
            height: 150,
            width: 150,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
            left: 60,
            top: 160,
            child: Text(
              category,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            )),
      ],
    ),
  );
}

Widget recommendedCard(
    {required String imgUrl, required String name, required String price}) {
  return Container(
    margin: const EdgeInsets.all(10),
    child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image(
              image: NetworkImage(imgUrl),
              height: 90,
              width: 90,
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5),
            Text('₹$price',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700])),
          ],
        ),
      ),
    ),
  );
}

class NavigationDrawer extends StatefulWidget {
  NavigationDrawer({
    super.key,
  });
  // final Users user;

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  final AuthServices _auth = AuthServices();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var userId = auth.currentUser;
      if (userId != null) {
        BlocProvider.of<AllProductsBloc>(context)
            .add(FetchOrders(uId: userId.uid));
        BlocProvider.of<WishlistBloc>(context)
            .add(FetchAllWhislistedProducts(uId: userId.uid));
      }
    });
    return SafeArea(
      child: Drawer(
        width: MediaQuery.of(context).size.width * .65,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              builderHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget builderHeader(BuildContext context) {
    var uId = FirebaseAuth.instance.currentUser;
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: BlocBuilder<AllProductsBloc, AllProductsState>(
        builder: (context, state) {
          // if(uId == null){
          //   return Center(child: Text('please login!',style: centerText.copyWith(color: Colors.white),));
          // }
          // if(state.userDetails == null){

          // }
          if (state.userDetails != null || uId == null) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Home(
                          index: 3,
                        )));
              },
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Image.asset('assets/images/UserImage.png'),
                ),
                title: Text(
                  uId != null ? state.userDetails['username'] : 'Profile',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  uId != null ? state.userDetails['mail'] : '',
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            );
          } else {
            return const Loading();
          }
        },
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    var userId = auth.currentUser;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          // runSpacing: 16,
          children: [
            // sidebarListTile(
            //     text: 'Home',
            //     icon: Icons.home_outlined,
            //     ontap: () {
            //       Navigator.pop(context);
            //     }),
            sidebarListTile(
                text: 'Orders',
                icon: Icons.shopping_bag_outlined,
                ontap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const OrdersMainScreen()));
                }),
            sidebarListTile(
                text: 'Whishlist',
                icon: Icons.favorite_border_outlined,
                ontap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const WhishlistScreen()));
                }),
            sidebarListTile(
                text: 'Terms and Conditions',
                icon: Icons.help_center_outlined,
                ontap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TermsAndConditions()));
                }),
            sidebarListTile(
                text: 'Privacy Policies',
                icon: Icons.privacy_tip_outlined,
                ontap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PrivacyPolicy()));
                }),
            sidebarListTile(
                text: 'About',
                icon: Icons.info_outline,
                ontap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AboutPage()));
                }),
          ],
        ),
        Column(children: [
          userId != null
              ? ListTile(
                  title: const Text('Logout'),
                  trailing: const Icon(Icons.login_outlined),
                  onTap: () async {
                    toggleView();
                    showAlertDialog1(context);
                  },
                )
              : ListTile(
                  title: const Text('login'),
                  trailing: const Icon(Icons.logout_outlined),
                  onTap: () async {
                    toggleView();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => SignInScreen()));
                  },
                ),
        ])
      ],
    );
  }

  ListTile sidebarListTile(
      {required IconData icon,
      required String text,
      required Function() ontap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: ontap,
    );
  }

  showAlertDialog1(BuildContext context) {
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
        await _auth.signOut();

        toggleView();
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Logout"),
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
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LicensePage(
      applicationName: 'Sound Square',
      applicationVersion: '1.0',
      applicationLegalese: 'Developed By \nAbdul Yazer N',
    );
  }
}
