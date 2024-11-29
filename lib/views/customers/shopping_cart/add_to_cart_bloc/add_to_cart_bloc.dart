import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/cart_reposirtory.dart';

part 'add_to_cart_event.dart';
part 'add_to_cart_state.dart';

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  AddToCartBloc() : super(AddToCartInitial()) {
    on<AddToCartEvent>((event, emit) async {
      CartRepository cartRepository = CartRepository();
      if (event is AddingEvent) {
        try {
          final res = await cartRepository.addToCart(event.id);
          print(res);
          emit(AddToCartSuccess());
        } catch (e) {
          emit(AddToCartError(e.toString()));
        }
      }
    });
  }
}
