import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/model/restaurant/menu_response.dart';
import 'package:food_delivery/data/repository/customer_repository.dart';

part 'filter_cafe_foods_event.dart';
part 'filter_cafe_foods_state.dart';

class FilterCafeFoodsBloc
    extends Bloc<FilterCafeFoodsEvent, FilterCafeFoodsState> {
  FilterCafeFoodsBloc() : super(FilterCafeFoodsInitial()) {
    on<FilterCafeFoodsEvent>((event, emit) async {
      CustomerRepository customerRepository = CustomerRepository();
      if (event is LoadFilterCafeFoodsEvent) {
        try {
          final res = await customerRepository.filterCafeFoods(
              event.categoryName, event.id);
          emit(FilterCafeFoodsSuccess(res));
        } catch (e) {
          emit(FilterCafeFoodsError('errorrr'));
        }
      }
    });
    on<ResetFilterCafeFoodsEvent>((event, emit) {
      emit(FilterCafeFoodsInitial());
    });
  }
}
