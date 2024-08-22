import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/model/restaurant/menu_response.dart';
import 'package:food_delivery/data/repository/customer_repository.dart';

part 'cafe_detail_event.dart';
part 'cafe_detail_state.dart';

class CafeDetailBloc extends Bloc<CafeDetailEvent, CafeDetailState> {
  CafeDetailBloc() : super(CafeDetailInitial()) {
    on<CafeDetailEvent>((event, emit) async {
      CustomerRepository customerRepository = CustomerRepository();
      if (event is LoadCafeDetailEvent) {
        try {
          final res = await customerRepository.fetchCafeFoods(event.id);
          emit(CafeDetailSuccess(res));
        } catch (e) {
          emit(CafeDetailError('errorrr'));
        }
      }
    });
  }
}
