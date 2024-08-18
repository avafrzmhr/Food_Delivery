import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/model/restaurant/restaurant_response.dart';
import 'package:food_delivery/data/repository/owner_repository.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class OwnerRestaurantBloc
    extends Bloc<OwnerRestaurantEvent, OwnerRestaurantState> {
  OwnerRestaurantBloc() : super(OwnerRestaurantInitial()) {
    on<OwnerRestaurantEvent>((event, emit) async {
      OwnerRepository ownerRepository = OwnerRepository();
      if (event is LoadOwnerRestaurantEvent) {
        try {
          final res = await ownerRepository.fetchRestaurant();
          emit(OwnerRestaurantSuccess(res));
        } catch (e) {
          emit(OwnerRestaurantError('errorrr'));
        }
      }
    });
  }
}
