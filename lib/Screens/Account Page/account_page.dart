import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundsquare/Screens/Account%20Page/account_details.dart';
import 'package:soundsquare/Screens/Account%20Page/saved_addresses.dart';
import 'package:soundsquare/application/wishlist/wishlist_bloc.dart';
import 'package:soundsquare/constants/constants.dart';
import 'package:soundsquare/constants/motion_toast.dart';

import '../../application/all_products/all_products_bloc.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 578,
            width: double.infinity,
            decoration: BoxDecoration(
                color: mainYlClr,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                BlocBuilder<AllProductsBloc, AllProductsState>(
                  builder: (context, state) {
                    var uId = FirebaseAuth.instance.currentUser;
                    return Column(
                      children: [
                        const Image(
                            image: AssetImage('assets/images/UserImage.png')),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          uId != null
                              ? state.userDetails['username']
                              : 'Profile',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(uId != null ? state.userDetails['mail'] : 'mail'),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: BlocBuilder<AllProductsBloc, AllProductsState>(
                    builder: (context, state) {
                      return ListTile(
                        leading: const Icon(Icons.person_outline),
                        title: const Text('My Account'),
                        subtitle: const Text('Edit your informations'),
                        trailing: const Icon(Icons.arrow_right_alt),
                        onTap: () {
                          var uId = FirebaseAuth.instance.currentUser;
                          if (uId != null) {
                            BlocProvider.of<AllProductsBloc>(context)
                                .add(FetchUserDetails(uId: uId.uid));
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AccountDetailsScreen(
                                      email:
                                          state.userDetails['mail'] ?? 'mail',
                                      password1:
                                          state.userDetails['password'] ??
                                              'password',
                                      password2:
                                          state.userDetails['password'] ??
                                              'password',
                                      phone: state.userDetails['phoneNumber']
                                          .toString(),
                                      username: state.userDetails['username'] ??
                                          'username',
                                    )));
                          } else {
                            motionToastCustom(context, 'Login First!',
                                'https://assets10.lottiefiles.com/packages/lf20_QKRDTQ.json');
                          }
                        },
                      );
                    },
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: ListTile(
                      leading: const Icon(Icons.home_outlined),
                      title: const Text('Saved Addresses'),
                      subtitle: const Text('Edit your addresses'),
                      trailing: const Icon(Icons.arrow_right_alt),
                      onTap: () {
                        var uId = FirebaseAuth.instance.currentUser;
                        if (uId != null) {
                          BlocProvider.of<WishlistBloc>(context)
                              .add(FetchUserAddress(uId: uId.uid));
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const SavedAddressesScreen()));
                        } else {
                          motionToastCustom(context, 'Login First!',
                              'https://assets10.lottiefiles.com/packages/lf20_QKRDTQ.json');
                        }
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Card orderCard(BuildContext context) {
//   return Card(
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//     margin: const EdgeInsets.all(30),
//     color: Colors.white,
//     child: Container(
//       width: 330,
//       child: Column(
//         children: [
//           Padding(
//             padding:
//                 const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 15),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: const [Text('ORDER #CS1020'), Text('IN PROGRESS')],
//             ),
//           ),
//           const Divider(),
//           Padding(
//             padding:
//                 const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 interestedItems(),
//                 interestedItems(),
//                 interestedItems(),
//               ],
//             ),
//           ),
//           const Divider(),
//           const SizedBox(
//             height: 10,
//           ),
//           const Text('Your order is on it\'s way!'),
//           const SizedBox(
//             height: 10,
//           ),
//           const Text('Orders will arrive in 3 days!'),
//           const SizedBox(
//             height: 20,
//           ),
//           TextButton(
//               style: TextButton.styleFrom(
//                   backgroundColor: mainYlClr,
//                   padding: const EdgeInsets.only(left: 50, right: 50)),
//               onPressed: () {
//                 // trackingOrderBottomSheet(context);
//               },
//               child: const Text(
//                 'TRACK',
//                 style: TextStyle(color: Colors.black),
//               )),
//           const SizedBox(
//             height: 20,
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Column interestedItems() {
//   return Column(
//     children: [
//       Container(
//         height: 70,
//         width: 85,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15), color: Colors.grey[200]),
//         child: const Image(image: AssetImage('assets/images/SampleImage2.png')),
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       const Text('Beosound 1')
//     ],
//   );
// }

// Future<dynamic> trackingOrderBottomSheet(BuildContext context) {
//   return showModalBottomSheet(
//     enableDrag: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20), topRight: Radius.circular(20)),
//       ),
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//             builder: (context, setState) => SingleChildScrollView(
//               child: Container(
//                 height: MediaQuery.of(context).size.height,
//                     decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(20),
//                             topRight: Radius.circular(20))),
//                     child: Column(
//                       children: [
//                         const SizedBox(
//                           height: 60,
//                         ),
//                         Container(
//                           height: 80,
//                           width: 80,
//                           decoration: BoxDecoration(
//                             color: mainYlClr,
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: const Icon(
//                             Icons.table_chart_outlined,
//                             size: 55,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         const Text(
//                           'Tracking Order',
//                           style: TextStyle(
//                               fontSize: 24, fontWeight: FontWeight.w600),
//                         ),
//                         const SizedBox(
//                           height: 60,
//                         ),
//                         const Divider(),
//                         Padding(
//                           padding: const EdgeInsets.all(20),
//                           child: TextFormField(
//                             decoration: InputDecoration(
//                               contentPadding: const EdgeInsets.all(5),
//                                 hintText: 'Enter Tracking Number',
//                                 hintStyle: const TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w500),
//                                 suffixIcon: const Icon(
//                                   Icons.search,
//                                   color: Colors.black,
//                                 ),
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(15),
//                                     borderSide: BorderSide.none),
//                                 filled: true,
//                                 fillColor: Colors.grey[200]),
//                           ),
//                         ),
//                         TextIconButton(text: 'Search', color: mainYlClr, ontap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AccountScreen())))
//                       ],
//                     ),
//                   ),
//             ));
//       });
// }
