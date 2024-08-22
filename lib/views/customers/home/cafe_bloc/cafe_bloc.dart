import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/model/restaurant/restaurant_response.dart';
import 'package:food_delivery/data/repository/customer_repository.dart';

part 'cafe_event.dart';
part 'cafe_state.dart';

class CafeBloc extends Bloc<CafeEvent, CafeState> {
  CafeBloc() : super(CafeInitial()) {
    on<CafeEvent>((event, emit) async {
      CustomerRepository customerRepository = CustomerRepository();
      if (event is LoadCafeEvent) {
        try {
          final res = await customerRepository.fetchCafe();
          emit(CafeSuccess(res));
        } catch (e) {
          emit(CafeError('errorrr'));
        }
      }
    });
  }
}
