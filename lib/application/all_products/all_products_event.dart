part of 'all_products_bloc.dart';

@freezed
class AllProductsEvent with _$AllProductsEvent {
  const factory AllProductsEvent.fetchAllProducts() = FetchAllProducts;

  const factory AllProductsEvent.fetchAllSpeakers() = FetchAllSpeakers;
  const factory AllProductsEvent.fetchAllWirelessSpeakers() = FetchAllWirelessSpeakers;
  const factory AllProductsEvent.fetchAllWiredSpeakers() = FetchAllWiredSpeakers;


  const factory AllProductsEvent.fetchAllHeadphones() = FetchAllHeadphones;
  const factory AllProductsEvent.fetchAllWirelessHeadphones() = FetchAllWirelessHeadphones;
  const factory AllProductsEvent.fetchAllWiredHeadphones() = FetchAllWiredHeadphones;


  const factory AllProductsEvent.fetchAllEarphones() = FetchAllEarphones;
  const factory AllProductsEvent.fetchAllWirelessEarphones() = FetchAllWirelessEarphones;
  const factory AllProductsEvent.fetchAllWiredEarphones() = FetchAllWiredEarphones;

  const factory AllProductsEvent.fetchAllEarbuds() = FetchAllEarbuds;
  const factory AllProductsEvent.fetchAllWirelessEarbuds() = FetchAllWirelessEarbuds;
  const factory AllProductsEvent.fetchAllWiredEarbuds() = FetchAllWiredEarbuds;

  const factory AllProductsEvent.fetchAllProductsInCart({required String uId}) = FetchAllProductsInCart;
  

  const factory AllProductsEvent.addToCart({required String uId,required String id,required String? name,required String? brand,required String? price,required String? quantity,required String? category,required String? stock,required String? description,required String? subCategory,required String? imgUrl}) = AddToCart;
  const factory AllProductsEvent.updateQuantity({required String id,required String uId,required String quantity}) = UpdateQuantity;

  const factory AllProductsEvent.totalPrice({required String uId}) = TotalPrice;

  const factory AllProductsEvent.fetchUserDetails({required String uId}) = FetchUserDetails;

  const factory AllProductsEvent.updateUserDetails({required String uId,required String name,required String mail,required String phone,required String password}) = UpdateUserDetails;

  const factory AllProductsEvent.addOrders({required String uId,required String addressId,required String date,required String paymentType,required String status,required String totalPrice,required BuildContext context}) = AddOrders;

  const factory AllProductsEvent.fetchOrders({required String uId}) = FetchOrders;

  

  
  

  

  

  
  
}