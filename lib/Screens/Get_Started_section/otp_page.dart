import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:soundsquare/Screens/Get_Started_section/phonenumberverify_page.dart';
import 'package:soundsquare/Screens/Home/home.dart';
import 'package:soundsquare/Services/authFunctions.dart';
import 'package:soundsquare/Services/database.dart';
import 'package:soundsquare/constants/motion_toast.dart';
import '../../application/signUp/signup_bloc.dart';
import '../../constants/loading.dart';
import 'get_started_page.dart';

class OtpVerifyScreen extends StatelessWidget {
  OtpVerifyScreen({super.key, required this.phoneNumber});
  final String phoneNumber;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var code = '';
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return state.loading
          ? const Loading()
          : Scaffold(
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.black),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'OTP Authentication',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'An authentication code has been \nsent to the number',
                        style: TextStyle(color: Colors.black87, height: 1.5),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Pinput(
                        length: 6,
                        showCursor: true,
                        onChanged: (value) {
                          code = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Didn\'t get the code? ',
                            style:
                                TextStyle(fontSize: 13, color: Colors.black54),
                          ),
                          InkWell(
                            onTap: () {
                              final AuthServices _auth = AuthServices();

                              dynamic result = _auth.phoneNumberVerification(
                                  context, phoneNumber);
                            },
                            child: const Text('Resend code',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                      Column(
                        children: [
                          Center(
                              child: TextIconButton(
                                  text: 'Continue',
                                  icon: Icons.arrow_right_alt,
                                  color: const Color.fromRGBO(255, 219, 71, 1),
                                  ontap: () async {
                                    try {
                                      BlocProvider.of<SignupBloc>(context)
                                          .add(const IsLoading(loading: true));

                                      PhoneAuthCredential credential =
                                          PhoneAuthProvider.credential(
                                              verificationId:
                                                  PhoneNumberVerifyScreen
                                                      .verify,
                                              smsCode: code);
                                      var userId = AuthServices().user;
                                      UserCredential result = await _auth
                                          .signInWithCredential(credential);
                                      await DatabaseServices(
                                              uid: result.user!.uid)
                                          .addUserData(
                                              phoneNumber: phoneNumber);
                                      // await _auth.signInWithCredential(credential);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                   Home()));
                                    } catch (e) {
                                      BlocProvider.of<SignupBloc>(context)
                                          .add(const IsLoading(loading: false));
                                      var error = 'Wrong OTP';
                                      motionToastCustom(context, error,
                                          'https://assets3.lottiefiles.com/packages/lf20_dyZlfDsL2b.json');
                                    }
                                  })),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}
