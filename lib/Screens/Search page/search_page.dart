import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundsquare/constants/constants.dart';
import '../../application/wishlist/wishlist_bloc.dart';
import '../Home/speaker_details_page.dart';
import '../Home/home_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: const SizedBox(width: 1),
          title: TextFormField(
            decoration: InputDecoration(
                hintText: 'Search on audible',
                hintStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400),
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.grey[200]),
            onChanged: (value) {
              BlocProvider.of<WishlistBloc>(context).add(SearchedSong(query: value));
            },
          ),
        ),
        body: BlocBuilder<WishlistBloc, WishlistState>(
            builder: (context, state) {
          var uId = FirebaseAuth.instance.currentUser;
          var productList = List<dynamic>.from(state.searchedList);
          if (productList.isEmpty) {
            return Center(
              child: Text(
                'No products found',
                style: centerText,
              ),
            );
          }
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: productList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SpeakerDetailsScreen(
                              category: productList[index]['category'],
                              description: productList[index]['description'],
                              imgUrl: productList[index]['imgUrl'],
                              name: productList[index]['name'],
                              price: productList[index]['price'],
                              brand: productList[index]['brand'],
                              prodId: productList[index]['id'],
                              quantity: productList[index]['quantity'],
                              stock: productList[index]['stock'],
                              subCategory: productList[index]['subCategory'],
                              index: index,
                            )));
                  },
                  child: recommendedCard(
                      imgUrl: productList[index]['imgUrl'],
                      name: productList[index]['name'],
                      price: productList[index]['price']));
            },
          );
        }));
  }
}
