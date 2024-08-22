import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/model/restaurant/category_model.dart';
import 'package:food_delivery/data/repository/owner_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      OwnerRepository ownerRepository = OwnerRepository();
      if (event is LoadCategoryEvent) {
        try {
          final res = await ownerRepository.fetchCategory();
          emit(CategorySuccess(res));
        } catch (e) {
          emit(CategoryError('errorrr'));
        }
      }
    });
  }
}
