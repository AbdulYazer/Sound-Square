import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:soundsquare/Screens/Get_Started_section/get_started_page.dart';
import 'package:soundsquare/application/all_products/all_products_bloc.dart';
import 'package:soundsquare/constants/motion_toast.dart';
import '../../Services/authFunctions.dart';
import '../../application/signUp/signup_bloc.dart';
import '../../constants/constants.dart';

class AccountDetailsScreen extends StatelessWidget {
    AccountDetailsScreen({super.key,required this.email,
    required this.username,
    required this.phone,
    required this.password1,
    required this.password2,});

  late TextEditingController _nameController;

  late TextEditingController _emailController;

  late TextEditingController _password1Controller;

  late TextEditingController _password2Controller;

  late TextEditingController _phoneController;

  final AuthServices _auth = AuthServices();

  final _formKey = GlobalKey<FormState>();

  String email;

  String phone;

  String password1;

  String password2;

  String username;

  String error = '';

  String newPassword = '';

  String newEmail = '';

  // TextEditingController _password1Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _nameController = TextEditingController(text: username);
    _emailController = TextEditingController(text: email);
    _password1Controller = TextEditingController(text: password1);
    _password2Controller = TextEditingController(text: password2);
    _phoneController = TextEditingController(text: phone);
    newPassword = password2;
    newEmail = email;
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return Scaffold(
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
                        'User Details',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
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
                              controller: _emailController,
                              onchanged: (value) => newEmail = value,
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
                                Icons.person,
                                color: Colors.black,
                              ),
                              controller: _nameController,
                              onchanged: (value) => username = value,
                              validator: (value) {
                                return value!.isEmpty
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
                              controller: _phoneController,
                              onchanged: (value) => phone = value,
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Enter a valid phone number'
                                    : null;
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            passwordFormField(
                              text: 'Password',
                              onchanged: ((value) {
                                password1 = value;
                              }),
                              controller: _password1Controller
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            passwordFormField(
                              text: 'Confirm password',
                              onchanged: ((value1) {
                                newPassword = value1;
                              }),
                              controller: _password2Controller
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
                                  text: 'SAVE',
                                  icon: Icons.arrow_right_alt,
                                  color: const Color.fromRGBO(255, 219, 71, 1),
                                  ontap: () {
                                    var uId = FirebaseAuth.instance.currentUser;
                                    if (_formKey.currentState!.validate()) {
                                      BlocProvider.of<SignupBloc>(context)
                                              .add(const IsLoading(
                                                  loading: true));
                                      if(uId != null){
                                        if (password1 == newPassword) {
                                          showAlertDialog(context, uId: uId.uid,username: username, email: email, phone: phone, password: password2, newEmail: newEmail, newPassword: newPassword);
                                          BlocProvider.of<SignupBloc>(context)
                                              .add(const IsLoading(
                                                  loading: false));
                                        }
                                       else {
                                        BlocProvider.of<SignupBloc>(context)
                                            .add(const IsLoading(
                                                loading: false));
                                        error = 'Passwords doesn\'t match';
                                        motionToastCustom(context, error,
                                            'https://assets10.lottiefiles.com/packages/lf20_QKRDTQ.json');
                                      }
                                      }
                                      }
                                      
                                    }
                          );
                          }
                          )
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

  dynamic passwordFormField(
      {required String text, required Function(String) onchanged,required TextEditingController? controller}) {
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
              controller: controller,
          onChanged: onchanged,
          validator: ((value) {
            return value!.length < 6 ? 'Enter a password 6+ chars long' : null;
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
    this.validator, this.controller,
  }) : super(key: key);
  final TextEditingController? controller;
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
      controller: controller,
      validator: validator,
    );
  }
}

Future showAlertDialog(BuildContext context, {required uId,required email,
  required username,
  required phone,
  required password,
  required newEmail,
  required newPassword
  }) {
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: const Text("ok"),
    onPressed: () async {
      BlocProvider.of<AllProductsBloc>(context).add(UpdateUserDetails(uId: uId, name: username, mail: newEmail, phone: phone, password: newPassword));
      AuthServices().updateEmailAndPassword(email,newEmail,password,newPassword);
      BlocProvider.of<AllProductsBloc>(context).add(FetchUserDetails(uId: uId));
      Navigator.pop(context);
      MotionToast(
                  height: 130,
                  width: 200,
                  toastDuration: const Duration(seconds: 2),
                  position: MotionToastPosition.center,
                  primaryColor: mainYlClr,
                  description: Center(
                    child: Column(
                      children: [
                        Lottie.network(
                            'https://assets1.lottiefiles.com/private_files/lf30_yo2zavgg.json',
                            height: 70,
                            width: 70,
                            fit: BoxFit.contain),
                        const Text(
                          'USER DETAILS UPDATED',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ).show(context);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Update Details"),
    content: const Text("Are you sure ?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

