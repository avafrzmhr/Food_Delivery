import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/model/restaurant/menu_response.dart';
import 'package:food_delivery/data/repository/owner_repository.dart';

part 'menu_foods_event.dart';
part 'menu_foods_state.dart';

class MenuFoodsBloc extends Bloc<MenuFoodsEvent, MenuFoodsState> {
  MenuFoodsBloc() : super(MenuFoodsInitial()) {
    on<MenuFoodsEvent>((event, emit) async {
      OwnerRepository ownerRepository = OwnerRepository();
      if (event is LoadMenuFoodsEvent) {
        try {
          final res = await ownerRepository.fetchRestaurantFoods();
          emit(MenuFoodsSuccess(res));
        } catch (e) {
          emit(MenuFoodsError('errorrr'));
        }
      }
    });
  }
}
