import 'package:dio/dio.dart';
import 'package:food_delivery/data/model/restaurant/restaurant_response.dart';
import 'package:food_delivery/data/source/customer_data_source.dart';

abstract class ICustomerRepository {
  Future<Response> customerAddress(String addressName, double lat, double long);
  Future<Restaurant> fetchRestaurants();
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
}
