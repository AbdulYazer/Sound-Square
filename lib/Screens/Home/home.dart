import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundsquare/Screens/Account%20Page/account_page.dart';
import 'package:soundsquare/Screens/Cart%20Page/cart_page.dart';
import 'package:soundsquare/Screens/Search%20page/search_page.dart';
import 'package:soundsquare/constants/constants.dart';
import '../../application/all_products/all_products_bloc.dart';
import 'home_page.dart';

class Home extends StatefulWidget {
   Home({super.key,this.index});
   int? index;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var screens = [
      HomeScreen(),
      const SearchScreen(),
      const CartScreen(),
      AccountScreen(),
    ];
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          unselectedIconTheme: const IconThemeData(color: Colors.black),
          type: BottomNavigationBarType.fixed,
          currentIndex:widget.index == null ? _currentIndex : widget.index!,
          elevation: 20,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: '',
                backgroundColor: Colors.black,
                activeIcon: bottomNavBarIcon(icon: Icons.home_outlined)),
            BottomNavigationBarItem(
                icon: const Icon(Icons.search),
                label: '',
                backgroundColor: Colors.black,
                activeIcon: bottomNavBarIcon(icon: Icons.search)),
            BottomNavigationBarItem(
                icon: shoppingCartWithCount(context,Colors.transparent),
                label: '',
                backgroundColor: Colors.black,
                activeIcon:
                shoppingCartWithCount(context,mainYlClr)),
                    // bottomNavBarIcon(icon: Icons.shopping_cart_checkout)),
            BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: '',
                backgroundColor: Colors.black,
                activeIcon: bottomNavBarIcon(icon: Icons.person_outline)),
          ],
          onTap: (index) {
            setState(() {
               widget.index = null;
              _currentIndex = index;
            });
          },
        ),
        body: screens[widget.index == null ? _currentIndex : widget.index!]);
  }
}

Widget shoppingCartWithCount(BuildContext context, Color activeClr) {
  return Badge(
    backgroundColor: Colors.red[400],
    label: BlocBuilder<AllProductsBloc, AllProductsState>(
      builder: (context, state) {
        int value = 0;
        var user = FirebaseAuth.instance.currentUser;
        if(user!=null){
          if (state.allProductsInCartList != null) {
          value = state.allProductsInCartList!.length;
        }
        return Text(
          '$value',
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        );
        }
        return Text(
          '$value',
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        );
        
      },
    ),
    alignment: const AlignmentDirectional(.5, -1),
    child:Container(
    height: 30,
    width: 40,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: activeClr),
    child: const Icon(
      Icons.shopping_cart_checkout,
      color: Colors.black,
      size: 24,
    ),
  ),
   
    // ),
  );
}

Widget bottomNavBarIcon({required IconData icon}) {
  return Container(
    height: 30,
    width: 40,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: mainYlClr),
    child: Icon(
      icon,
      color: Colors.black,
      size: 24,
    ),
  );
}
