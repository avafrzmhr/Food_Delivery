import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/data/repository/customer_repository.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc() : super(RestaurantInitial()) {
    on<LoadDataEvent>((event, emit) async {
      try {
        emit(RestaurantLoading());
        CustomerRepository customerRepository = CustomerRepository();

        List<dynamic> restaurants = [];
        List<dynamic> cafes = [];

        if (event.loadRestaurants) {
          final res = await customerRepository.fetchRestaurants();
          restaurants = res.data;
        }

        if (event.loadCafes) {
          final res = await customerRepository.fetchCafe();
          cafes = res.data;
        }

        emit(RestaurantSuccess(restaurants: restaurants, cafes: cafes));
      } catch (e) {
        emit(RestaurantError('Error loading data: $e'));
      }
    });
  }
}
