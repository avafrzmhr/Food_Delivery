import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/model/restaurant/menu_response.dart';
import 'package:food_delivery/data/repository/customer_repository.dart';

part 'filter_res_foods_event.dart';
part 'filter_res_foods_state.dart';

class FilterRestaurantFoodsBloc
    extends Bloc<FilterRestaurantFoodsEvent, FilterRestaurantFoodsState> {
  FilterRestaurantFoodsBloc() : super(FilterRestaurantFoodsInitial()) {
    on<FilterRestaurantFoodsEvent>((event, emit) async {
      CustomerRepository customerRepository = CustomerRepository();
      if (event is LoadFilterRestaurantFoodsEvent) {
        try {
          final res = await customerRepository.filterRestaurantFoods(
              event.categoryName, event.id);
          emit(FilterRestaurantFoodsSuccess(res));
        } catch (e) {
          emit(FilterRestaurantFoodsError('errorrr'));
        }
      }
    });
    on<ResetFilterRestaurantFoodsEvent>((event, emit) {
      emit(FilterRestaurantFoodsInitial());
    });
  }
}
