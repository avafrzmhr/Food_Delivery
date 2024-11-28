import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/model/restaurant/restaurant_response.dart';
import 'package:food_delivery/data/repository/customer_repository.dart';

part 'favorite_list_event.dart';
part 'favorite_list_state.dart';

class FavoriteListBloc extends Bloc<FavoriteListEvent, FavoriteListState> {
  FavoriteListBloc() : super(FavoriteListInitial()) {
    on<FavoriteListEvent>((event, emit) async {
      CustomerRepository customerRepository = CustomerRepository();
      if (event is LoadFavoriteListEvent) {
        try {
          final res = await customerRepository.getFavorites();
          List<dynamic> favorites = res.data; // Assuming res.data is a list
          List<RestaurantModel> restaurantData =
              favorites.map<RestaurantModel>((item) {
            return RestaurantModel.fromJson(item['restaurant']);
          }).toList();
          List<int> favoriteIds =
              favorites.map<int>((item) => item['id']).toList();

          emit(FavoriteListSuccess(restaurantData, favoriteIds));
        } catch (e) {
          emit(FavoriteListError('Error loading favorites: $e'));
        }
      }
    });
  }
}
