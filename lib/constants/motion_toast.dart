import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

motionToastCustom(BuildContext context, String error, String url) {
  return MotionToast(
    height: 130,
    width: 200,
    toastDuration: const Duration(seconds: 3),
    position: MotionToastPosition.center,
    primaryColor: Colors.red,
    description: Center(
      child: Column(
        children: [
          Lottie.network(
              url,
              height: 70,
              width: 70,
              fit: BoxFit.contain),
          Text(
            error,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  ).show(context);
}
