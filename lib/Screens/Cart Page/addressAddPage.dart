import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundsquare/application/wishlist/wishlist_bloc.dart';
import '../../constants/constants.dart';
import '../Get_Started_section/get_started_page.dart';

class AddressAddScreen extends StatelessWidget {
  AddressAddScreen({super.key});

  final GlobalKey<FormState> _formkey = GlobalKey();

  FirebaseStorage storage = FirebaseStorage.instance;

  String name = '';

  String number = '';

  String pincode = '';

  String area = '';

  String town = '';

  String state = '';

  String country = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textForm(
                    text: 'Name',
                    validator: (value) {
                      return value!.trim().isEmpty ? 'Enter the name' : null;
                    },
                    onchanged: (value) {
                      name = value;
                    }),
                const SizedBox(
                  height: 10,
                ),
                textForm(
                    text: 'Mobile number',
                    validator: (value) {
                      return value!.trim().isEmpty ? 'Enter the mobile number' : null;
                    },
                    onchanged: (value) {
                      number = value;
                    }),
                const SizedBox(
                  height: 10,
                ),
                textForm(
                    text: 'Pincode',
                    validator: (value) {
                      return value!.trim().isEmpty ? 'Enter the pincode' : null;
                    },
                    onchanged: (value) {
                      pincode = value;
                    }),
                const SizedBox(
                  height: 10,
                ),
                textForm(
                    text: 'Area,Street,Village',
                    validator: (value) {
                      return value!.trim().isEmpty
                          ? 'Enter the area,street,village'
                          : null;
                    },
                    onchanged: (value) {
                      area = value;
                    }),
                const SizedBox(
                  height: 10,
                ),
                textForm(
                    text: 'Town/City',
                    validator: (value) {
                      return value!.trim().isEmpty ? 'Enter the town/city' : null;
                    },
                    onchanged: (value) {
                      town = value;
                    }),
                const SizedBox(
                  height: 10,
                ),
                textForm(
                    text: 'State',
                    validator: (value) {
                      return value!.trim().isEmpty ? 'Enter the state' : null;
                    },
                    onchanged: (value) {
                      state = value;
                    }),
                const SizedBox(
                  height: 10,
                ),
                textForm(
                    text: 'Country',
                    validator: (value) {
                      return value!.trim().isEmpty ? 'Enter the country' : null;
                    },
                    onchanged: (value) {
                      country = value;
                    }),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: TextIconButton(
                    text: 'ADD THIS ADDRESS',
                    color: mainYlClr,
                    ontap: () async{
                      if (_formkey.currentState!.validate()) {
                        var uId = FirebaseAuth.instance.currentUser;
                        if(uId != null){
                          BlocProvider.of<WishlistBloc>(context).add(AddUserAddress(name: name, number: number, pincode: pincode, area: area, town: town, state: state, country: country, uId: uId.uid));
                          BlocProvider.of<WishlistBloc>(context).add(FetchUserAddress(uId: uId.uid));
                          Future.delayed(const Duration(seconds: 1),(){
                            return Navigator.pop(context);
                          });
                        }
                      }
                    },
                    icon: Icons.arrow_right_alt,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField textForm(
      {required String text,
      required String? Function(String?) validator,
      required Function(String) onchanged}) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: text,
          enabledBorder:
              const OutlineInputBorder(borderSide: BorderSide(width: 0))),
      validator: validator,
      onChanged: onchanged,
    );
  }
}
