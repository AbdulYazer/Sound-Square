import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundsquare/Screens/Get_Started_section/get_started_page.dart';
import 'package:soundsquare/Screens/Get_Started_section/signin_page.dart';
import 'package:soundsquare/Screens/Home/home.dart';
import 'package:soundsquare/constants/loading.dart';
import 'package:soundsquare/constants/motion_toast.dart';

import '../../Services/authFunctions.dart';
import '../../application/signUp/signup_bloc.dart';
import '../../constants/constants.dart';
class SignUpScreen extends StatelessWidget {
 SignUpScreen({super.key});

  final AuthServices _auth = AuthServices();

  final _formKey = GlobalKey<FormState>();

  String email = '';

  String password = '';

  String password1 = '';

  String password2 = '';

  String username = '';

  String phone = '';

  String error = '';

  // TextEditingController _password1Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return state.loading
          ? const Loading()
          : Scaffold(
              appBar: AppBar(
                elevation: 0,
                iconTheme: const IconThemeData(color: Colors.black),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Getting Started',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Create an account to continue!',
                        style: TextStyle(color: Colors.black87),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            UserNameFormField(
                              text: 'Email',
                              icon: const Icon(
                                Icons.mail,
                                color: Colors.black,
                              ),
                              onchanged: (value) => email = value,
                              validator: (value) {
                                if (RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(email)) {
                                  return null;
                                } else {
                                  return 'Enter valid email';
                                }
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            UserNameFormField(
                              text: 'Username',
                              icon: const Icon(
                                Icons.person_outlined,
                                color: Colors.black,
                              ),
                              onchanged: (value) => username = value,
                              validator: (value) {
                                return value!.trim().isEmpty
                                    ? 'Enter an username'
                                    : null;
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            UserNameFormField(
                              text: 'Phone Number',
                              icon: const Icon(
                                Icons.phone,
                                color: Colors.black,
                              ),
                              onchanged: (value) => phone = value,
                              validator: (value) {
                                return value!.trim().isEmpty
                                    ? 'Enter an username'
                                    : null;
                              },
                              keyboardTextType: TextInputType.phone,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            passwordFormField(
                              text: 'Password',
                              onchanged: ((value) {
                                password1 = value;
                              }),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            passwordFormField(
                              text: 'Confirm password',
                              onchanged: ((value1) {
                                password2 = value1;
                              }),
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Center(child: BlocBuilder<SignupBloc, SignupState>(
                            builder: (context, state) {
                              return TextIconButton(
                                  text: 'SIGN UP',
                                  icon: Icons.login,
                                  color: const Color.fromRGBO(255, 219, 71, 1),
                                  ontap: ()  {
                                    if (_formKey.currentState!.validate()) {
                                      BlocProvider.of<SignupBloc>(context)
                                          .add(const IsLoading(loading: true));
                                      if (password1 == password2) {
                                        dynamic result =  _auth
                                            .signUpWithEmailAndPassword(
                                                email, password1, username, phone);
                                        if (result == null) {
                                          BlocProvider.of<SignupBloc>(context)
                                              .add(const IsLoading(
                                                  loading: false));
                                          error =
                                              'something got up please try again';
                                          motionToastCustom(context, error,
                                              'https://assets10.lottiefiles.com/packages/lf20_QKRDTQ.json');
                                        } else {
                                          // ignore: use_build_context_synchronously
                                          BlocProvider.of<SignupBloc>(context)
                                              .add(const IsLoading(
                                                  loading: false));
                                            // Navigator.of(context).pushReplacement(
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             const PhoneNumberVerifyScreen()));
                                          
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                       Home()));
                                        }
                                      } else {
                                        BlocProvider.of<SignupBloc>(context)
                                            .add(const IsLoading(
                                                loading: false));
                                        error = 'Passwords doesn\'t match';
                                        motionToastCustom(context, error,
                                            'https://assets10.lottiefiles.com/packages/lf20_QKRDTQ.json');
                                      }
                                    }
                                  });
                            },
                          )),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account? ',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black54),
                              ),
                              InkWell(
                                onTap: () => Navigator.of(context)
                                    .pushNamedAndRemoveUntil('/signin',
                                        (Route<dynamic> route) => false),
                                child: const Text('Sign in',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Center(
                          //   child: TextIconButton(
                          //     text: 'Connect with Google',
                          //     color: Colors.grey.shade300,
                          //     preIcon: Container(
                          //         width: 30,
                          //         height: 30,
                          //         child: Image.asset(
                          //           'assets/images/googleicon.png',
                          //           fit: BoxFit.contain,
                          //         )),
                          //     ontap: () => Navigator.of(context).push(
                          //         MaterialPageRoute(
                          //             builder: (context) => SignInScreen())),
                          //   ),
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }

  dynamic passwordFormField(
      {required String text, required Function(String) onchanged}) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.text,
          //  controller: _userPasswordController,
          obscureText: !state.passwordVisible,
          decoration: passwordInputDecoration.copyWith(
              suffixIcon: IconButton(
                icon: Icon(
                  state.passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.black,
                ),
                onPressed: () {
                  BlocProvider.of<SignupBloc>(context)
                      .add(const PasswordVisible());
                },
              ),
              labelText: text),
          onChanged: onchanged,
          // ((value) {
          //   setState(() {
          //     password = value;
          //   });
          // }),
          validator: ((value) {
            return value!.trim().length < 6 ? 'Enter a password 6+ chars long' : null;
          }),
        );
      },
    );
  }
}

class UserNameFormField extends StatelessWidget {
  UserNameFormField({
    Key? key,
    required this.text,
    this.icon,
    this.keyboardTextType,
    this.onchanged,
    this.validator,
  }) : super(key: key);
  final String text;
  final Widget? icon;
  final TextInputType? keyboardTextType;
  Function(String)? onchanged;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      keyboardType: keyboardTextType,
      maxLines: 1,
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        prefixIcon: icon,
        labelText: text,
        labelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 128, 127, 127)),
        floatingLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
      ),
      validator: validator,
    );
  }
}
