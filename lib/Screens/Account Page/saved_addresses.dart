import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundsquare/Screens/Account%20Page/edit_adress.dart';
import 'package:soundsquare/constants/constants.dart';
import '../../Services/database.dart';
import '../../application/wishlist/wishlist_bloc.dart';
import '../Cart Page/addressAddPage.dart';

class SavedAddressesScreen extends StatelessWidget {
  const SavedAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var uId = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: appbar1('SAVED ADDRESSES', IconButton(
        icon:const Icon(Icons.add_box_outlined),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddressAddScreen()));
        },
        )),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          // var uId = FirebaseAuth.instance.currentUser;
          if (uId != null) {
            BlocProvider.of<WishlistBloc>(context)
                .add(FetchUserAddress(uId: uId.uid));
          }
          List _addresses = state.userAddressList;
          if (uId == null) {
            return Center(
              child: Text(
                'Login First!',
                style: centerText,
              ),
            );
          }
          if (state.userAddressList.isEmpty) {
            return Center(
              child: Text(
                'No Saved Address!',
                style: centerText,
              ),
            );
          }
          return ListView.separated(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${state.userAddressList[index]['name']}'),
                    Text('${state.userAddressList[index]['number']}'),
                    Text('${state.userAddressList[index]['pincode']}'),
                    Text('${state.userAddressList[index]['area']}'),
                    Text('${state.userAddressList[index]['town']}'),
                    Text('${state.userAddressList[index]['state']}'),
                    Text('${state.userAddressList[index]['country']}'),
                  ],
                ),
                trailing: IconButton(onPressed: () async{
                  await DatabaseServices().deleteAddress(uId: uId.uid, id: state.userAddressList[index]['id']);
                  BlocProvider.of<WishlistBloc>(context).add(FetchUserAddress(uId: uId.uid));
                }, icon: Icon(Icons.delete)),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditAddressScreen(
                            name: state.userAddressList[index]['name'],
                            number: state.userAddressList[index]['number'],
                            pincode: state.userAddressList[index]['pincode'],
                            area: state.userAddressList[index]['area'],
                            town: state.userAddressList[index]['town'],
                            state: state.userAddressList[index]['state'],
                            country: state.userAddressList[index]['country'],
                            id: state.userAddressList[index]['id'],
                          )));
                },
              );
            },
            itemCount: state.userAddressList.length,
            separatorBuilder: ((context, index) => const Divider()),
          );
        },
      ),
    );
  }

  AppBar appbar1(String text, Widget icon) {
    return AppBar(
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: true,
      title: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 16),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: icon,
        )
      ],
    );
  }
}
