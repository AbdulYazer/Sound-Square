part of 'all_products_bloc.dart';

@freezed
class AllProductsState with _$AllProductsState {
  const factory AllProductsState({
    required dynamic function,
    required List<dynamic>? allProductsList,
    required List<dynamic>? allSpeakersList,
    required List<dynamic>? allWirelessSpeakersList,
    required List<dynamic>? allWiredSpeakersList,
    required List<dynamic>? allProductsInCartList,
    required String quantity,
    required int total,
    required dynamic userDetails,
    required List<dynamic>? orderList,
    required List<dynamic>? allOrdersList,
    
  }) = Initial;
  factory AllProductsState.initial(){
    return const AllProductsState(allProductsList: null, allSpeakersList: null, allWiredSpeakersList: null, allWirelessSpeakersList: null, function: null, allProductsInCartList: null, quantity: '', total: 0, userDetails: null, orderList: [], allOrdersList: []);
  }
}
