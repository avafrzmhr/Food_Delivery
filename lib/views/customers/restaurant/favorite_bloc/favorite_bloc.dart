import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/customer_repository.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<FavoriteEvent>((event, emit) async {
      CustomerRepository customerRepository = CustomerRepository();
      if (event is AddFavorite) {
        try {
          final res = await customerRepository.addToFavorite(event.resID);
          print(res);
          emit(FavoriteSuccess());
        } catch (e) {
          emit(FavoriteError(e.toString()));
        }
      }
      if (event is DelFavorite) {
        try {
          final res = await customerRepository.removeFavorite(event.id);
          print(res);
          emit(FavoriteSuccess());
        } catch (e) {
          emit(FavoriteError(e.toString()));
        }
      }
    });
  }
}
