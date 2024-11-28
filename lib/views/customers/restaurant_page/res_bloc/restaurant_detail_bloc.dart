import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/model/restaurant/menu_response.dart';
import 'package:food_delivery/data/repository/customer_repository.dart';

part 'restaurant_detail_event.dart';
part 'restaurant_detail_state.dart';

class RestaurantDetailBloc
    extends Bloc<RestaurantDetailEvent, RestaurantDetailState> {
  RestaurantDetailBloc() : super(RestaurantDetailInitial()) {
    on<RestaurantDetailEvent>((event, emit) async {
      CustomerRepository customerRepository = CustomerRepository();
      if (event is LoadRestaurantDetailEvent) {
        try {
          final res = event.isCafe
              ? await customerRepository.fetchCafeFoods(event.id)
              : await customerRepository.fetchRestaurantFoods(event.id);
          emit(RestaurantDetailSuccess(res));
        } catch (e) {
          emit(RestaurantDetailError('errorrr'));
        }
      }
    });
  }
}
