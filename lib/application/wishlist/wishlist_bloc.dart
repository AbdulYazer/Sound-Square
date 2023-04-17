import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soundsquare/Services/database.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';
part 'wishlist_bloc.freezed.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistState.initial()) {
    on<AddToWishlist>((event, emit) async{
      emit(state.copyWith(function: await DatabaseServices().addToWishlist(id: event.id, uId: event.uId, name: event.name, brand: event.brand, price: event.price, quantity: event.quantity, description: event.description, category: event.category, stock: event.stock, subCategory: event.subCategory, imgUrl: event.imgUrl)));
    });

    on<RemoveFromWishlist>((event, emit) async{
      emit(state.copyWith(function: await DatabaseServices().deleteProductFromWishlist(uId: event.uId, id: event.id)));
    });

    on<FetchAllWhislistedProducts>((event, emit) async{
      var result = await DatabaseServices().productsInWishlist(uId: event.uId);
      emit(state.copyWith(allProductsInWishlist: result));
    });

    on<SearchedSong>((event, emit) async{
      var result = await DatabaseServices().getSearchedProductsList(query: event.query);
      emit(state.copyWith(searchedList: result));
    });

    on<AddUserAddress>((event, emit) async{
      emit(state.copyWith(function: await DatabaseServices().addUserAddress(uId: event.uId!, name: event.name, number: event.number, pincode: event.pincode, area: event.area, town: event.town, state: event.state, country: event.country)));
    });

    on<FetchUserAddress>((event, emit) async{
      var result = await DatabaseServices().fetchUserAddress(uId: event.uId);
      emit(state.copyWith(userAddressList: result));
    });

    on<RadioBtnValue>((event, emit) {
      emit(state.copyWith(value: event.value));
    });

    on<EditUserAddress>((event, emit) async{
      emit(state.copyWith(function: await DatabaseServices().editUserAddress(id: event.id, uId: event.uId!, name: event.name, number: event.number, pincode: event.pincode, area: event.area, town: event.town, state: event.state, country: event.country)));
    });

    on<ChangeStatus>((event, emit) async{
      await DatabaseServices().changeStatus(status: event.status, orderId: event.orderId, userId: event.userId);
      emit(state.copyWith(status: event.status));
    });


  }
}
