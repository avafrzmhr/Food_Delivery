import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/data/model/restaurant/restaurant_response.dart';
import 'package:food_delivery/data/repository/customer_repository.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc() : super(RestaurantInitial()) {
    on<RestaurantEvent>((event, emit) async {
      CustomerRepository customerRepository = CustomerRepository();
      if (event is LoadRestaurantEvent) {
        try {
          final res = await customerRepository.fetchRestaurants();
          emit(RestaurantSuccess(res));
        } catch (e) {
          emit(RestaurantError('errorrr'));
        }
      }
    });
  }
}
