import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:food_delivery/data/model/restaurant/restaurant_response.dart';
import 'package:food_delivery/providers.dart';

class CustomerDataSource {
  Dio dio = Dio();

  Future<Response> customerAddress(
      String addressName, double lat, double long) async {
    Response response1 = await dio.get(
      'http://127.0.0.1:8000/account/customer_address/',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'JWT ${Providers.prefs.getString('access')}',
        },
      ),
    );
    print(response1.data);
    int id = response1.data[0]['id'];
    Response response = await dio.put(
      "http://127.0.0.1:8000/account/customer_address/$id/",
      data: {
        "address_name": addressName,
        "latitude": lat,
        "longitude": long,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'JWT ${Providers.prefs.getString('access')}',
        },
      ),
    );
    print(response);
    return response;
  }

  Future<Restaurant> fetchRestaurants() async {
    Response response = await dio.get(
      'http://127.0.0.1:8000/customer/restaurants',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'JWT ${Providers.prefs.getString('access')}',
        },
      ),
    );
    if (response.statusCode == 200) {
      var restaurantResponse = restaurantFromJson(jsonEncode(response.data));
      print(Providers.prefs.getString('access'));
      return restaurantResponse;
    } else {
      throw Exception('erorr');
    }
  }
}
