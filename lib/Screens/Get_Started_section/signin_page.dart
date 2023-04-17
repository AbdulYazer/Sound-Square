import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundsquare/Screens/Get_Started_section/get_started_page.dart';
import 'package:soundsquare/Screens/Get_Started_section/signup_page.dart';
import 'package:soundsquare/Screens/Home/home.dart';
import 'package:soundsquare/constants/loading.dart';
import 'package:soundsquare/constants/motion_toast.dart';
import '../../Services/authFunctions.dart';
import '../../application/signUp/signup_bloc.dart';
import '../../constants/constants.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final AuthServices _auth = AuthServices();

  String email = '';

  String password = '';

  bool login = false;

  String error = '';

  // bool loading = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return state.loading
          ? const Loading()
          : Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Let’s Sign You In',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Welcome back, you’ve been missed!',
                            style: TextStyle(color: Colors.black87),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          UserNameFormField(
                            text: 'Username or Email',
                            icon: const Icon(
                              Icons.person_outlined,
                              color: Colors.black,
                            ),
                            onchanged: (value) => email = value,
                            validator: (value) {
                              return value!.trim().isEmpty
                                  ? 'Enter the valid mail'
                                  : null;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          passwordFormField(),
                          const SizedBox(
                            height: 150,
                          ),
                          Column(
                            children: [
                              Center(
                                  child: TextIconButton(
                                text: 'SIGN IN',
                                icon: Icons.login,
                                color: const Color.fromRGBO(255, 219, 71, 1),
                                ontap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<SignupBloc>(context)
                                            .add(const IsLoading(
                                                loading: true));
                                    dynamic result =
                                        await _auth.signInWithEmailAndPassword(
                                            email, password);
                                    if (result == null) {
                                     BlocProvider.of<SignupBloc>(context)
                                            .add(const IsLoading(
                                                loading: false));
                                        error =
                                            'could not sign with those credentials';
                                        motionToastCustom(context, error,
                                            'https://assets10.lottiefiles.com/packages/lf20_QKRDTQ.json');
                                    } else {
                                      BlocProvider.of<SignupBloc>(context)
                                            .add(const IsLoading(
                                                loading: false));
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                   Home()),(route)=> false);
                                    }
                                  }
                                },
                              )),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Don\'t have an account? ',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black54),
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.of(context)
                                        .pushNamedAndRemoveUntil('/signup',
                                            (Route<dynamic> route) => false),
                                    child: const Text('Sign up',
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
                              //       text: 'Connect with Google',
                              //       color: Colors.grey.shade300,
                              //       preIcon: Container(
                              //           width: 30,
                              //           height: 30,
                              //           child: Image.asset(
                              //             'assets/images/googleicon.png',
                              //             fit: BoxFit.contain,
                              //           )),
                              //       ontap: () {}),
                              // )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
    });
  }

  dynamic passwordFormField() {
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
              labelText: 'Password'),
          onChanged: (value) => password = value,
          validator: ((value) {
            return value!.trim().length < 6 ? 'Enter a password 6+ chars long' : null;
          }),
        );
      },
    );
  }
}
