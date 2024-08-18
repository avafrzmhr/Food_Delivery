import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/owner_repository.dart';

part 'add_food_event.dart';
part 'add_food_state.dart';

class AddFoodBloc extends Bloc<AddFoodEvent, AddFoodState> {
  AddFoodBloc() : super(AddFoodInitial()) {
    on<AddFoodEvent>((event, emit) async {
      OwnerRepository ownerRepository = OwnerRepository();
      if (event is AddFoodRequestEvent) {
        try {
          final res = await ownerRepository.addFood(
              event.image, event.name, event.desc, event.category, event.price);
          print(res);
          emit(AddFoodSuccess());
        } catch (e) {
          emit(AddFoodError('errorrr'));
        }
      }
    });
  }
}
