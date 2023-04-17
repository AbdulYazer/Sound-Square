import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String? uid;
  DatabaseServices({this.uid});

  //collection reference
  final CollectionReference audibleCollection =
      FirebaseFirestore.instance.collection('users');
  Future addUserData(
      {String? username,
      String? mail,
      String? password,
      String? phoneNumber}) async {
    final collectionId = audibleCollection.doc(uid);
    return await collectionId.set({
      'id': collectionId.id,
      'username': username,
      'mail': mail,
      'password': password,
      'phoneNumber': phoneNumber
    });
  }

  Future updateUserData(
      {String? uId,
      String? username,
      String? mail,
      String? password,
      String? phoneNumber}) async {
    final collectionId = audibleCollection.doc(uId);
    return await collectionId.update({
      'username': username,
      'mail': mail,
      'password': password,
      'phoneNumber': phoneNumber
    });
  }

  final CollectionReference userAddressCollection =
      FirebaseFirestore.instance.collection('address');
  Future addUserAddress(
      {required String uId,
      required String? name,
      required String? number,
      required String? pincode,
      required String? area,
      required String? town,
      required String? state,
      required String? country}) async {
    final collectionId =
        userAddressCollection.doc(uId).collection(uId).doc(uid);
    return await collectionId.set({
      'id': collectionId.id,
      'name': name,
      'number': number,
      'pincode': pincode,
      'area': area,
      'town': town,
      'state': state,
      'country': country
    });
  }

// ----------------------to fetch all products----------------------------------

  Future<List<dynamic>> getProductsList() async {
    List allProductsList = [];
    try {
      final prod =
          await FirebaseFirestore.instance.collection('products').get();
      prod.docs.forEach((element) {
        return allProductsList.add(element.data());
      });
      return allProductsList;
    } catch (e) {
      print(e.toString());
      return allProductsList;
    }
  }

  //----------------------to fetch each categories----------------------------------

  Future<List<dynamic>> getAllSpeakers(
      {required String where, required String isEqualTo}) async {
    List allSpeakersList = [];
    try {
      final prod = await FirebaseFirestore.instance
          .collection('products')
          .where(where, isEqualTo: isEqualTo)
          .get();
      prod.docs.forEach((element) {
        return allSpeakersList.add(element.data());
      });
      return allSpeakersList;
    } catch (e) {
      print(e.toString());
      return allSpeakersList;
    }
  }

  Future<List<dynamic>> getSpeakers(
      {required String isEqualTo,
      required String where,
      required String category}) async {
    List allSpeakersList = [];
    try {
      final prod = await FirebaseFirestore.instance
          .collection('products')
          .where('category', isEqualTo: category)
          .where(where, isEqualTo: isEqualTo)
          .get();
      prod.docs.forEach((element) {
        return allSpeakersList.add(element.data());
      });
      return allSpeakersList;
    } catch (e) {
      print(e.toString());
      return allSpeakersList;
    }
  }

  // --------------------------------Cart functions -----------------------------------

  final CollectionReference audibleCartCollection =
      FirebaseFirestore.instance.collection('cart');
  Future addToCart(
      {required String id,
      required String uId,
      required String? name,
      required String? brand,
      required String? price,
      required String? quantity,
      required String? description,
      required String? category,
      required String? stock,
      required String? subCategory,
      required String? imgUrl}) async {
    audibleCartCollection.doc(uId).collection(uId).doc(id).set({
      'id': id,
      'name': name,
      'brand': brand,
      'price': price,
      'quantity': quantity,
      'description': description,
      'category': category,
      'stock': stock,
      'subCategory': subCategory,
      'imgUrl': imgUrl
    });
  }

  Future<List<dynamic>> productsInCart({required String uId}) async {
    List cartProductsList = [];
    try {
      final cartProd =
          await audibleCartCollection.doc(uId).collection(uId).get();
      cartProd.docs.forEach((element) {
        return cartProductsList.add(element.data());
      });
      return cartProductsList;
    } catch (e) {
      print(e.toString());
      return cartProductsList;
    }
  }

  Future updateQuantity(
      {required String id,
      required String uId,
      required String quantity}) async {
    audibleCartCollection
        .doc(uId)
        .collection(uId)
        .doc(id)
        .update({'quantity': quantity});
  }

  Future totalPrice({required String uId}) async {
    int total = 0;
    var result = await productsInCart(uId: uId);
    for (int i = 0; i < result.length; i++) {
      total += int.parse(result[i]['price'].toString()) *
          int.parse(result[i]['quantity'].toString());
    }
    return total;
  }

  Future deleteProductFromCart(
      {required String uId, required String id}) async {
    audibleCartCollection.doc(uId).collection(uId).doc(id).delete();
  }

  // --------------------------------Wishlist functions -----------------------------------

  final CollectionReference audibleWishlistCollection =
      FirebaseFirestore.instance.collection('wishlist');
  Future addToWishlist(
      {required String id,
      required String uId,
      required String? name,
      required String? brand,
      required String? price,
      required String? quantity,
      required String? description,
      required String? category,
      required String? stock,
      required String? subCategory,
      required String? imgUrl}) async {
    audibleWishlistCollection.doc(uId).collection(uId).doc(id).set({
      'id': id,
      'name': name,
      'brand': brand,
      'price': price,
      'quantity': quantity,
      'description': description,
      'category': category,
      'stock': stock,
      'subCategory': subCategory,
      'imgUrl': imgUrl
    });
  }

  Future<List<dynamic>> productsInWishlist({required String uId}) async {
    List<dynamic> wishlistProductsList = [];
    try {
      final cartProd =
          await audibleWishlistCollection.doc(uId).collection(uId).get();
      cartProd.docs.forEach((element) {
        return wishlistProductsList.add(element.data());
      });
      return wishlistProductsList;
    } catch (e) {
      print(e.toString());
      return wishlistProductsList;
    }
  }

  Future deleteProductFromWishlist(
      {required String uId, required String id}) async {
    audibleWishlistCollection.doc(uId).collection(uId).doc(id).delete();
  }

  // --------------------------------Search functions -----------------------------------

  Future<List<dynamic>> getSearchedProductsList({required String query}) async {
    List allSearchedProductsList = [];
    List afterSearchList = [];
    try {
      final prod =
          await FirebaseFirestore.instance.collection('products').get();
      // for(int i=0;i<prod.docs.length;i++){
      //   return allSearchedProductsList = allSearchedProductsList.add(prod.docs.where((element) => element[i]['name'].toString().toLowerCase().contains(query.toLowerCase())));
      //   // afterSearchList.add(element.data());
      // }
      prod.docs.forEach((element) {
        return allSearchedProductsList.add(element.data());
      });

      return afterSearchList = allSearchedProductsList
          .where((element) => element['name']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    } catch (e) {
      print(e.toString());
      return afterSearchList;
    }
  }

  //----------------------------------Fetching user details----------------------------------

  Future fetchUserData({required String uId}) async {
    dynamic userDetails;
    try {
      final userdoc =
          await FirebaseFirestore.instance.collection('users').doc(uId).get();
      dynamic userDetails = userdoc.data();
      return userDetails;
    } catch (e) {
      print(e.toString());
      return userDetails;
    }
  }

  Future fetchUserAddress({required String uId}) async {
    List userAddressList = [];
    try {
      final userdoc = await FirebaseFirestore.instance
          .collection('address')
          .doc(uId)
          .collection(uId)
          .get();
      userdoc.docs.forEach((element) {
        return userAddressList.add(element.data());
      });
      return userAddressList;
    } catch (e) {
      print(e.toString());
      return userAddressList;
    }
  }

  Future editUserAddress(
      {required String? id,
      required String uId,
      required String? name,
      required String? number,
      required String? pincode,
      required String? area,
      required String? town,
      required String? state,
      required String? country}) async {
    final collectionId = userAddressCollection.doc(uId).collection(uId).doc(id);
    collectionId.update({
      'id': id,
      'name': name,
      'number': number,
      'pincode': pincode,
      'area': area,
      'town': town,
      'state': state,
      'country': country
    });
  }

  Future deleteAddress({required String uId, required String id}) async {
    await userAddressCollection.doc(uId).collection(uId).doc(id).delete();
  }

  Future deleteAllProductFromCart({required String uId}) async {
    try {
      var cartItems = await audibleCartCollection.doc(uId).collection(uId);
      cartItems.get().then((QuerySnapshot) {
        QuerySnapshot.docs.forEach((element) {
          element.reference.delete();
        });
      });
      await audibleCartCollection.doc(uId).delete();
    } catch (e) {
      print(e.toString());
    }
  }

  final CollectionReference audibleOrdersCollection =
      FirebaseFirestore.instance.collection('orders');

  Future addOrders(
      {required String uId,
      required String addressId,
      required String date,
      required String paymentType,
      required String status,
      required String totalPrice}) async {
    try {
      final userAddressDoc = await FirebaseFirestore.instance
          .collection('address')
          .doc(uId)
          .collection(uId)
          .doc(addressId)
          .get();
      dynamic userAddressDetails = userAddressDoc.data();
      var result = await productsInCart(
        uId: uId,
      );
      var audibleOrdersCollectionId =
          audibleOrdersCollection.doc(uId).collection(uId).doc();
      audibleOrdersCollectionId.set({
        'date': date,
        'paymentType': paymentType,
        'id': audibleOrdersCollectionId.id,
        'status': status,
        'totalPrice': totalPrice,
        'userId': uId,
        'products': result.map((element) {
          return {
            'id': element['id'],
            'name': element['name'],
            'brand': element['brand'],
            'price': element['price'],
            'quantity': element['quantity'],
            'description': element['description'],
            'category': element['category'],
            'stock': element['stock'],
            'subCategory': element['subCategory'],
            'imgUrl': element['imgUrl'],
          };
        }).toList(),
        'address': FieldValue.arrayUnion([
          {
            'name': userAddressDetails['name'],
            'number': userAddressDetails['number'],
            'pincode': userAddressDetails['pincode'],
            'area': userAddressDetails['area'],
            'town': userAddressDetails['town'],
            'state': userAddressDetails['state'],
            'country': userAddressDetails['country']
          }
        ])
      }).then((value) => deleteAllProductFromCart(uId: uId));
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<dynamic>> fetchOrders({required String uId}) async {
    List ordersList = [];
    try {
      final orders =
          await audibleOrdersCollection.doc(uId).collection(uId).get();
      orders.docs.forEach((element) {
        return ordersList.add(element.data());
      });
      return ordersList;
    } catch (e) {
      print(e.toString());
      return ordersList;
    }
  }

  Future changeStatus({required String status,required String orderId,required String userId}) async{
    await FirebaseFirestore.instance.collection('orders').doc(userId).collection(userId).doc(orderId).update(
      {
        'status': status
      }
    );
  }
}
