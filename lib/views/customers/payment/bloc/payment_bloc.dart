import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/cart_reposirtory.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentEvent>((event, emit) async {
      CartRepository cartRepository = CartRepository();
      if (event is LoadPaymentEvent) {
        try {
          final res = await cartRepository.addToCart(event.orderId);
          print(res);
          emit(PaymentSuccess());
        } catch (e) {
          emit(PaymentError(e.toString()));
        }
      }
    });
  }
}
