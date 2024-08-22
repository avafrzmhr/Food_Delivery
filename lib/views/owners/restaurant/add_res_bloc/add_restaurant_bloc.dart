import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/data/repository/owner_repository.dart';

part 'add_restaurant_event.dart';
part 'add_restaurant_state.dart';

class AddRestaurantBloc extends Bloc<AddRestaurantEvent, AddRestaurantState> {
  AddRestaurantBloc() : super(AddRestaurantInitial()) {
    on<AddRestaurantEvent>((event, emit) async {
      OwnerRepository ownerRepository = OwnerRepository();
      if (event is AddRestaurantRequestEvent) {
        try {
          final res = await ownerRepository.addRestaurant(
            event.image,
            event.category,
            event.deliveryTime,
            event.minCartPrice,
            event.deliveryPrice,
            event.name,
            event.phoneNumber,
            event.openTime,
            event.closeTime,
            event.address,
            event.lat,
            event.long,
          );
          print(res.data);
          emit(AddRestaurantSuccess());
        } catch (e) {
          emit(AddRestaurantError('errorrr'));
        }
      }
    });
  }
}
