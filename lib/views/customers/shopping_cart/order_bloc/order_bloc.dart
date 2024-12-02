import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/model/restaurant/order_model.dart';
import 'package:food_delivery/data/repository/cart_reposirtory.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<OrderEvent>((event, emit) async {
      CartRepository cartRepository = CartRepository();
      if (event is LoadOrderEvent) {
        try {
          final res = await cartRepository.orderPage(event.id);
          print(res.data.detail[1]
              .image); // Outputs: "http://localhost:8000/media/restaurants/chad-montano-MqT0asuoIcU-unsplash.jpg"

          emit(OrderSuccess(res));
        } catch (e) {
          emit(OrderError('errorrr'));
        }
      }
      if (event is AddCustomerAddress) {
        try {
          final res = await cartRepository.putOrderAddress(
              event.id, event.address, event.lat, event.long, event.orderID);
          emit(OrderSuccess(res));
        } catch (e) {
          emit(OrderError('errorrr'));
        }
      }
    });
  }
}
