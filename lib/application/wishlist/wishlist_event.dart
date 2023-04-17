part of 'wishlist_bloc.dart';

@freezed
class WishlistEvent with _$WishlistEvent {
  const factory WishlistEvent.addToWishlist({required String uId,required String id,required String? name,required String? brand,required String? price,required String? quantity,required String? category,required String? stock,required String? description,required String? subCategory,required String? imgUrl}) = AddToWishlist;
  const factory WishlistEvent.removeFromWishlist({required String uId,required String id}) = RemoveFromWishlist;
  const factory WishlistEvent.fetchAllWhislistedProducts({required String uId}) = FetchAllWhislistedProducts;
  const factory WishlistEvent.searchedSong({required String query}) = SearchedSong;
  const factory WishlistEvent.addUserAddress({required String? name,required String? number,required String? pincode,required String? area,required String? town,required String? state,required String? country,required String? uId}) = AddUserAddress;
  const factory WishlistEvent.fetchUserAddress({required String uId}) = FetchUserAddress;
  const factory WishlistEvent.editUserAddress({required String? name,required String? number,required String? pincode,required String? area,required String? town,required String? state,required String? country,required String? uId,required String? id}) = EditUserAddress;
  const factory WishlistEvent.radioBtnValue({required dynamic value}) = RadioBtnValue;
  const factory WishlistEvent.changeStatus({required String status,required String orderId,required String userId}) = ChangeStatus;
  
  
  
  



  

  
  
  
}
