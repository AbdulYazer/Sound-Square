import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soundsquare/Screens/Account%20Page/account_page.dart';
import 'package:soundsquare/Screens/Cart%20Page/cart_page.dart';
import 'package:soundsquare/Screens/Get_Started_section/get_started_page.dart';
import 'package:soundsquare/Screens/Get_Started_section/signin_page.dart';
import 'package:soundsquare/Screens/Get_Started_section/signup_page.dart';
import 'package:soundsquare/Screens/Get_Started_section/splash_screen.dart';
import 'package:soundsquare/Screens/Home/home.dart';
import 'package:soundsquare/application/all_products/all_products_bloc.dart';
import 'package:soundsquare/application/signUp/signup_bloc.dart';
import 'package:soundsquare/application/wishlist/wishlist_bloc.dart';
import 'Screens/Cart Page/Shipping_Page.dart';
import 'Services/authFunctions.dart';
import 'models/user.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return StreamProvider<Users>.value(
    value: AuthServices().users,
    initialData: Users(),
    child:MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignupBloc(),
        ),
        BlocProvider(
          create: (context) => AllProductsBloc(),
        ),
        BlocProvider(
          create: (context) => WishlistBloc(),
        ),    
      ],
      child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sound Square',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              listTileTheme: const ListTileThemeData(iconColor: Colors.black),
              iconTheme: const IconThemeData(color: Colors.black),
              primaryIconTheme: const IconThemeData(color: Colors.black),
              appBarTheme: const AppBarTheme(color: Colors.white,titleTextStyle: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),iconTheme: IconThemeData(color: Colors.black)),
              textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.black),bodyMedium: TextStyle(color: Colors.black)),
              primarySwatch: Colors.blue,
            ),
            home: const MyHomePage(),
            routes: {
              '/signin' : (context) => SignInScreen(),
              '/signup' :(context) => SignUpScreen(),
              // '/otp':(context) =>  OtpVerifyScreen(),
              '/tracking' : (context) => AccountScreen(),
              '/cart' : (context) => const CartScreen(),
            },
          ),
    ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future checkFirstSeen(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const SplashScreen()));
    } else {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const GetStarted()));
    }
  }
  @override
  Widget build(BuildContext context) {
    checkFirstSeen(context);
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator()
      ),
    );
  }
}
