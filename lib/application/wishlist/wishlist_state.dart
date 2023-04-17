part of 'wishlist_bloc.dart';

@freezed
class WishlistState with _$WishlistState {
  const factory WishlistState({
    required dynamic function,
    required List<dynamic> allProductsInWishlist,
    required List<dynamic> searchedList,
    required List<dynamic> userAddressList,
    required dynamic value,
    required String status

  }) = _Initial;

   factory WishlistState.initial(){
    return const WishlistState(allProductsInWishlist: [], function: null, searchedList: [], userAddressList: [], value: 0, status: '',);
   }
}
