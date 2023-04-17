import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundsquare/Screens/Get_Started_section/phonenumberverify_page.dart';
import 'package:soundsquare/Services/database.dart';
import 'package:soundsquare/application/signUp/signup_bloc.dart';

import '../Screens/Get_Started_section/otp_page.dart';
import '../models/user.dart';
// import 'package:flutter/material.dart';

class AuthServices {
  UserCredential? user;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on FirebaseUser
  Users? _userFromFirebaseUser(User user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<Users> get users {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!)!);
  }
 
  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and pass
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
       user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
       var userId = user!.user!;
      log(userId.toString());
      return _userFromFirebaseUser(userId);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and pass
  Future signUpWithEmailAndPassword(String email, String password,String username,String phone) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      await DatabaseServices(uid: user!.uid).addUserData(mail: email,password: password,username: username,phoneNumber: phone);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future phoneNumberVerification(
      BuildContext context, String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (credentials) {},
          verificationFailed: (e) {
            print(e.toString());
          },
          codeSent: (verificationId, resendToken) async{
            BlocProvider.of<SignupBloc>(context).add(IsLoading(loading: false));
            PhoneNumberVerifyScreen.verify = verificationId;
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => OtpVerifyScreen(phoneNumber: phoneNumber,)));
            
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future updateEmailAndPassword(String email,String newEmail,String password,String newPassword) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((userCredential) {
        userCredential.user!.updateEmail(newEmail);
        userCredential.user!.updatePassword(newPassword);
      });
      // var user = FirebaseAuth.instance.currentUser;
      // if(user!=null){
      //   user.updateEmail(email);
      //   user.updatePassword(password);
      // }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
