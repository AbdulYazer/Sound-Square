import 'package:flutter/material.dart';

Color mainYlClr = const Color.fromARGB(255, 245, 216, 100);

const passwordInputDecoration = InputDecoration(
  focusedBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
  prefixIcon: Icon(
    Icons.lock,
    color: Colors.black,
  ),
  floatingLabelStyle: TextStyle(
      fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
  labelStyle: TextStyle(
      fontWeight: FontWeight.w500, color: Color.fromARGB(255, 128, 127, 127)),
);
TextStyle centerText = const TextStyle(
    color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
TextStyle centerText2 = const TextStyle(
    color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
