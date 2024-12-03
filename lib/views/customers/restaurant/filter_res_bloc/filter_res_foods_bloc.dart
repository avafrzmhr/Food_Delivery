import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/model/restaurant/menu_response.dart';
import 'package:food_delivery/data/repository/customer_repository.dart';

part 'filter_res_foods_event.dart';
part 'filter_res_foods_state.dart';

class FilterFoodsBloc extends Bloc<FilterFoodsEvent, FilterFoodsState> {
  FilterFoodsBloc() : super(FilterFoodsInitial()) {
    on<FilterFoodsEvent>((event, emit) async {
      CustomerRepository customerRepository = CustomerRepository();
      if (event is FilterByCategoryEvent) {
        try {
          final res = event.isCafe
              ? await customerRepository.filterCafeFoods(
                  event.categoryName, event.id)
              : await customerRepository.filterRestaurantFoods(
                  event.categoryName, event.id);
          emit(FilterFoodsSuccess(res));
        } catch (e) {
          emit(FilterFoodsError('errorrr'));
        }
      }
    });

    on<ResetFilterFoodsEvent>((event, emit) {
      emit(FilterFoodsInitial());
    });
  }
}
