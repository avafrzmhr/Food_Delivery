import 'package:dio/dio.dart';
import 'package:food_delivery/data/model/restaurant/menu_response.dart';
import 'package:food_delivery/data/model/restaurant/restaurant_response.dart';
import 'package:food_delivery/data/source/customer_data_source.dart';

abstract class ICustomerRepository {
  Future<Response> customerAddress(String addressName, double lat, double long);
  Future<Restaurant> fetchRestaurants();
  Future<Restaurant> fetchCafe();
  Future<List<Menu>> fetchRestaurantFoods(int id);
  Future<List<Menu>> fetchCafeFoods(int id);
  Future<List<Menu>> filterRestaurantFoods(String categoryName, int id);
  Future<List<Menu>> filterCafeFoods(String categoryName, int id);
}

class CustomerRepository extends ICustomerRepository {
  @override
  Future<Response> customerAddress(
      String addressName, double lat, double long) async {
    var addressResponse =
        await CustomerDataSource().customerAddress(addressName, lat, long);
    return addressResponse;
  }

  @override
  Future<Restaurant> fetchRestaurants() async {
    var restaurantResponse = await CustomerDataSource().fetchRestaurants();
    return restaurantResponse;
  }

  @override
  Future<List<Menu>> fetchRestaurantFoods(int id) async {
    var foodResponse = await CustomerDataSource().fetchRestaurantFoods(id);
    return foodResponse;
  }

  @override
  Future<Restaurant> fetchCafe() async {
    var cafeResponse = await CustomerDataSource().fetchCafe();
    return cafeResponse;
  }

  @override
  Future<List<Menu>> filterRestaurantFoods(String categoryName, int id) async {
    var foodResponse =
        await CustomerDataSource().filterRestaurantFoods(categoryName, id);
    return foodResponse;
  }

  @override
  Future<List<Menu>> fetchCafeFoods(int id) async {
    var foodResponse = await CustomerDataSource().fetchCafeFoods(id);
    return foodResponse;
  }

  @override
  Future<List<Menu>> filterCafeFoods(String categoryName, int id) async {
    var foodResponse =
        await CustomerDataSource().filterCafeFoods(categoryName, id);
    return foodResponse;
  }
}
