import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/cart_reposirtory.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentEvent>((event, emit) async {
      CartRepository cartRepository = CartRepository();
      if (event is AddPaymentEvent) {
        try {
          final res = await cartRepository.payment(
              event.orderId, event.cardNum, event.cvv2);
          print(res);
          emit(PaymentSuccess(res));
        } catch (e) {
          emit(PaymentError(e.toString()));
        }
      } else if (event is VerifyPayment) {
        try {
          final res = await cartRepository.verifyPayment(event.orderId,
              event.cardNum, event.cvv2, event.dynamicPass, event.verification);
          print(res);
          emit(VerifyPaymentSuccess(res));
        } catch (e) {
          emit(PaymentError(e.toString()));
        }
      }
    });
  }
}
