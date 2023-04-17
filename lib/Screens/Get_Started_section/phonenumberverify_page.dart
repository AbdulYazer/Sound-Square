import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundsquare/Screens/Get_Started_section/get_started_page.dart';
import 'package:soundsquare/Screens/Get_Started_section/signup_page.dart';
import 'package:soundsquare/Services/authFunctions.dart';
import 'package:soundsquare/constants/motion_toast.dart';
import '../../application/signUp/signup_bloc.dart';
import '../../constants/loading.dart';

class PhoneNumberVerifyScreen extends StatefulWidget {
  const PhoneNumberVerifyScreen({super.key});
  static String verify = '';

  @override
  State<PhoneNumberVerifyScreen> createState() =>
      _PhoneNumberVerifyScreenState();
}

class _PhoneNumberVerifyScreenState extends State<PhoneNumberVerifyScreen> {
  final _formKey = GlobalKey<FormState>();
  final countryPicker = const FlCountryCodePicker();
  var countryCode;
  String phoneNumber = '';
  final AuthServices _auth = AuthServices();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
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
                      'Password Recovery',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Enter your Phone number to recover \nyour password',
                      style: TextStyle(color: Colors.black87, height: 1.5),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Form(
                      key: _formKey,
                      child: UserNameFormField(
                        text: 'Phone Number',
                        keyboardTextType: TextInputType.phone,
                        icon: countrySelector(),
                        onchanged: (value) {
                          phoneNumber = value;
                        },
                        validator: (value) {
                          return (value!.length < 10 || value.length > 10)
                              ? 'Enter valid phone number'
                              : null;
                        },
                      ),
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
                                  if (countryCode?.dialCode != null) {
                                    if (_formKey.currentState!.validate()) {
                                      BlocProvider.of<SignupBloc>(context)
                                            .add(const IsLoading(
                                                loading: true));
                                        phoneNumber =
                                            countryCode!.dialCode + phoneNumber;
                                      dynamic result =
                                          _auth.phoneNumberVerification(
                                              context, phoneNumber);
                                      if (result == null) {
                                        BlocProvider.of<SignupBloc>(context)
                                            .add(const IsLoading(
                                                loading: false));
                                          error = 'Enter valid phone number';
                                          motionToastCustom(context, error,
                                              'https://assets10.lottiefiles.com/packages/lf20_QKRDTQ.json');
                                      }
                                    }
                                  } else {
                                    BlocProvider.of<SignupBloc>(context)
                                            .add(const IsLoading(
                                                loading: false));
                                    error = 'please enter a country code';
                                    motionToastCustom(context, error,
                                        'https://assets10.lottiefiles.com/packages/lf20_QKRDTQ.json');
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
      }
    );
  }

  Container countrySelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () async {
              final code = await countryPicker.showPicker(context: context);
              setState(() {
                countryCode = code;
              });
            },
            child: Row(
              children: [
                Container(
                    child: countryCode?.flagImage ?? null),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 254, 251, 251),
                  ),
                  child: Text(countryCode?.dialCode ?? "+1"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
