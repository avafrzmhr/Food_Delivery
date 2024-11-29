import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/model/restaurant/cart_response.dart';
import 'package:food_delivery/data/repository/cart_reposirtory.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) async {
      CartRepository cartRepository = CartRepository();
      if (event is LoadCartEvent) {
        try {
          final res = await cartRepository.getCartItems();
          emit(CartSuccess(res));
        } catch (e) {
          emit(CartError('errorrr'));
        }
      }
    });
  }
}
