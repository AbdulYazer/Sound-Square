import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundsquare/application/wishlist/wishlist_bloc.dart';
import '../../constants/constants.dart';
import '../Get_Started_section/get_started_page.dart';

class EditAddressScreen extends StatelessWidget {
  EditAddressScreen(
      {super.key,
      required this.id,
      required this.name,
      required this.number,
      required this.pincode,
      required this.area,
      required this.town,
      required this.state,
      required this.country});

  final GlobalKey<FormState> _formkey = GlobalKey();

  FirebaseStorage storage = FirebaseStorage.instance;

  String name;

  String number;

  String pincode;

  String area;

  String town;

  String state;

  String country;

  String id;

  late TextEditingController _nameController;

  late TextEditingController _numberController;

  late TextEditingController _pincodeController;

  late TextEditingController _areaController;

  late TextEditingController _townController;

  late TextEditingController _stateController;

  late TextEditingController _countryController;

  @override
  Widget build(BuildContext context) {
    _nameController = TextEditingController(text: name);
    _numberController = TextEditingController(text: number);
    _pincodeController = TextEditingController(text: pincode);
    _areaController = TextEditingController(text: area);
    _townController = TextEditingController(text: town);
    _stateController = TextEditingController(text: state);
    _countryController = TextEditingController(text: country);
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
                      return value!.isEmpty ? 'Enter the name' : null;
                    },
                    controller: _nameController,
                    onchanged: (value) {
                      name = value;
                    }),
                const SizedBox(
                  height: 10,
                ),
                textForm(
                    text: 'Mobile number',
                    validator: (value) {
                      return value!.isEmpty ? 'Enter the mobile number' : null;
                    },
                    controller: _numberController,
                    onchanged: (value) {
                      number = value;
                    }),
                const SizedBox(
                  height: 10,
                ),
                textForm(
                    text: 'Pincode',
                    validator: (value) {
                      return value!.isEmpty ? 'Enter the pincode' : null;
                    },
                    controller: _pincodeController,
                    onchanged: (value) {
                      pincode = value;
                    }),
                const SizedBox(
                  height: 10,
                ),
                textForm(
                    text: 'Area,Street,Village',
                    validator: (value) {
                      return value!.isEmpty
                          ? 'Enter the area,street,village'
                          : null;
                    },
                    controller: _areaController,
                    onchanged: (value) {
                      area = value;
                    }),
                const SizedBox(
                  height: 10,
                ),
                textForm(
                    text: 'Town/City',
                    validator: (value) {
                      return value!.isEmpty ? 'Enter the town/city' : null;
                    },
                    controller: _townController,
                    onchanged: (value) {
                      town = value;
                    }),
                const SizedBox(
                  height: 10,
                ),
                textForm(
                    text: 'State',
                    validator: (value) {
                      return value!.isEmpty ? 'Enter the state' : null;
                    },
                    controller: _stateController,
                    onchanged: (value) {
                      state = value;
                    }),
                const SizedBox(
                  height: 10,
                ),
                textForm(
                    text: 'Country',
                    validator: (value) {
                      return value!.isEmpty ? 'Enter the country' : null;
                    },
                    controller: _countryController,
                    onchanged: (value) {
                      country = value;
                    }),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: TextIconButton(
                    text: 'EDIT THIS ADDRESS',
                    color: mainYlClr,
                    ontap: () async {
                      if (_formkey.currentState!.validate()) {
                        var uId = FirebaseAuth.instance.currentUser;
                        if (uId != null) {
                          BlocProvider.of<WishlistBloc>(context).add(
                              EditUserAddress(
                                  name: name,
                                  number: number,
                                  pincode: pincode,
                                  area: area,
                                  town: town,
                                  state: state,
                                  country: country,
                                  uId: uId.uid, id: id));
                          BlocProvider.of<WishlistBloc>(context)
                              .add(FetchUserAddress(uId: uId.uid));
                          Future.delayed(const Duration(seconds: 1), () {
                            return Navigator.pop(context);
                          });
                        }
                      }
                    },
                    // icon: Icons.arrow_right_alt,
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
      required Function(String) onchanged,required TextEditingController? controller}) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: text,
          enabledBorder:
              const OutlineInputBorder(borderSide: BorderSide(width: 0))),
      validator: validator,
      onChanged: onchanged,
      controller: controller,
    );
  }
}
