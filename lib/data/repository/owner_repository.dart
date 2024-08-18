import 'dart:io';

import 'package:dio/dio.dart';
import 'package:food_delivery/data/model/restaurant/category_model.dart';
import 'package:food_delivery/data/model/restaurant/menu_response.dart';
import 'package:food_delivery/data/model/restaurant/restaurant_response.dart';
import 'package:food_delivery/data/source/owner_data_source.dart';

abstract class IOwnerRepository {
  Future<Response> addRestaurant(
    File image,
    String category,
    String deliveryTime,
    double minCartPrice,
    double deliveryPrice,
    String name,
    String phoneNumber,
    String openTime,
    String closeTime,
    String address,
    double lat,
    double long,
  );
  Future<List<Menu>> fetchFoods();
  Future<Restaurant> fetchRestaurant();
  Future<Response> addFood(
    File image,
    String name,
    String desc,
    int category,
    double price,
  );
  Future<List<CategoryModel>> fetchCategory();
}

class OwnerRepository extends IOwnerRepository {
  @override
  Future<Response> addRestaurant(
    File image,
    String category,
    String deliveryTime,
    double minCartPrice,
    double deliveryPrice,
    String name,
    String phoneNumber,
    String openTime,
    String closeTime,
    String address,
    double lat,
    double long,
  ) async {
    var response = await OwnerDataSource().addRestaurant(
      image,
      category,
      deliveryTime,
      minCartPrice,
      deliveryPrice,
      name,
      phoneNumber,
      openTime,
      closeTime,
      address,
      lat,
      long,
    );
    return response;
  }

  @override
  Future<List<Menu>> fetchFoods() async {
    var response = await OwnerDataSource().fetchFoods();
    return response;
  }

  @override
  Future<Restaurant> fetchRestaurant() async {
    var response = await OwnerDataSource().fetchRestaurant();
    return response;
  }

  @override
  Future<Response> addFood(
      File image, String name, String desc, int category, double price) async {
    var response =
        await OwnerDataSource().addFood(image, name, desc, category, price);
    return response;
  }

  @override
  Future<List<CategoryModel>> fetchCategory() async {
    var response = await OwnerDataSource().fetchCategory();
    return response;
  }
}
