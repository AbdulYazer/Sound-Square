import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soundsquare/Services/database.dart';

import '../../Screens/Cart Page/orderreview_Page.dart';
import '../../Screens/Home/home.dart';

part 'all_products_event.dart';
part 'all_products_state.dart';
part 'all_products_bloc.freezed.dart';

class AllProductsBloc extends Bloc<AllProductsEvent, AllProductsState> {
  AllProductsBloc() : super(AllProductsState.initial()) {
    on<FetchAllProducts>((event, emit) async {
      var result = await DatabaseServices().getProductsList();
      emit(state.copyWith(allProductsList: result));
    });

    on<FetchAllSpeakers>((event, emit) async {
      var result = await DatabaseServices().getAllSpeakers(
        where: 'category',
        isEqualTo: 'Speakers',
      );
      emit(state.copyWith(allSpeakersList: result));
    });
    on<FetchAllWirelessSpeakers>((event, emit) async {
      var result = await DatabaseServices().getSpeakers(
          where: 'subCategory', isEqualTo: 'Wireless', category: 'Speakers');
      emit(state.copyWith(allWirelessSpeakersList: result));
    });
    on<FetchAllWiredSpeakers>((event, emit) async {
      var result = await DatabaseServices().getSpeakers(
          where: 'subCategory', isEqualTo: 'Wired', category: 'Speakers');
      emit(state.copyWith(allWiredSpeakersList: result));
    });

    on<FetchAllHeadphones>((event, emit) async {
      var result = await DatabaseServices()
          .getAllSpeakers(where: 'category', isEqualTo: 'Headphones');
      emit(state.copyWith(allSpeakersList: result));
    });
    on<FetchAllWirelessHeadphones>((event, emit) async {
      var result = await DatabaseServices().getSpeakers(
          where: 'subCategory', isEqualTo: 'Wireless', category: 'Headphones');
      emit(state.copyWith(allWirelessSpeakersList: result));
    });
    on<FetchAllWiredHeadphones>((event, emit) async {
      var result = await DatabaseServices().getSpeakers(
          where: 'subCategory', isEqualTo: 'Wired', category: 'Headphones');
      emit(state.copyWith(allWiredSpeakersList: result));
    });

    on<FetchAllEarphones>((event, emit) async {
      var result = await DatabaseServices()
          .getAllSpeakers(where: 'category', isEqualTo: 'Earphones');
      emit(state.copyWith(allSpeakersList: result));
    });
    on<FetchAllWirelessEarphones>((event, emit) async {
      var result = await DatabaseServices().getSpeakers(
          where: 'subCategory', isEqualTo: 'Wireless', category: 'Earphones');
      emit(state.copyWith(allWirelessSpeakersList: result));
    });
    on<FetchAllWiredEarphones>((event, emit) async {
      var result = await DatabaseServices().getSpeakers(
          where: 'subCategory', isEqualTo: 'Wired', category: 'Earphones');
      emit(state.copyWith(allWiredSpeakersList: result));
    });

    on<FetchAllEarbuds>((event, emit) async {
      var result = await DatabaseServices()
          .getAllSpeakers(where: 'category', isEqualTo: 'Earbuds');
      emit(state.copyWith(allSpeakersList: result));
    });
    on<FetchAllWirelessEarbuds>((event, emit) async {
      var result = await DatabaseServices().getSpeakers(
          where: 'subCategory', isEqualTo: 'Wireless', category: 'Earbuds');
      emit(state.copyWith(allWirelessSpeakersList: result));
    });
    on<FetchAllWiredEarbuds>((event, emit) async {
      var result = await DatabaseServices().getSpeakers(
          where: 'subCategory', isEqualTo: 'Wired', category: 'Earbuds');
      emit(state.copyWith(allWiredSpeakersList: result));
    });

    on<AddToCart>((event, emit) async {
      emit(state.copyWith(
          function: await DatabaseServices().addToCart(
              uId: event.uId,
              name: event.name,
              brand: event.brand,
              price: event.price,
              quantity: event.quantity,
              description: event.description,
              category: event.category,
              stock: event.stock,
              subCategory: event.subCategory,
              imgUrl: event.imgUrl,
              id: event.id)));
    });

    on<FetchAllProductsInCart>((event, emit) async {
      var result = await DatabaseServices().productsInCart(uId: event.uId);
      emit(state.copyWith(allProductsInCartList: result));
    });

    on<UpdateQuantity>((event, emit) async {
      emit(state.copyWith(quantity: event.quantity));
      emit(state.copyWith(
          function: DatabaseServices().updateQuantity(
              id: event.id, uId: event.uId, quantity: state.quantity)));
    });

    on<TotalPrice>((event, emit) async {
      int total = await DatabaseServices().totalPrice(uId: event.uId);
      emit(state.copyWith(total: total));
    });

    on<FetchUserDetails>((event, emit) async {
      var result = await DatabaseServices().fetchUserData(uId: event.uId);
      emit(state.copyWith(userDetails: result));
    });

    on<UpdateUserDetails>((event, emit) async {
      emit(state.copyWith(
          function: DatabaseServices().updateUserData(
              uId: event.uId,
              username: event.name,
              mail: event.mail,
              phoneNumber: event.phone,
              password: event.password)));
    });
    final _navigatorKey = GlobalKey<NavigatorState>();
    on<AddOrders>((event, emit) async {
      emit(state.copyWith(
          function: await DatabaseServices().addOrders(
              uId: event.uId,
              addressId: event.addressId,
              date: event.date,
              paymentType: event.paymentType,
              status: event.status,
              totalPrice: event.totalPrice)));
    });

    on<FetchOrders>((event, emit) async {
      var result = await DatabaseServices().fetchOrders(uId: event.uId);
      emit(state.copyWith(allOrdersList: result));
    });
  }
}
