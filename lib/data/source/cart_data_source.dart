import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:food_delivery/data/model/restaurant/cart_response.dart';
import 'package:food_delivery/main.dart';

class CartDataSource {
  Dio dio = Dio();

  Future<Response> addToCart(int id) async {
    Response response = await dio.post(
      'http://127.0.0.1:8000/cart/cart_item/',
      data: {
        "food_id": id,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'JWT ${MyApp.sharedPreferences.getString('access')}',
        },
      ),
    );
    if (response.statusCode == 200) {
      print(MyApp.sharedPreferences.getString('access'));
      return response.data;
    } else {
      throw Exception('erorr');
    }
  }

  Future<List<Cart>> getCartItems() async {
    Response response = await dio.get(
      'http://127.0.0.1:8000/cart/cart_item/',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'JWT ${MyApp.sharedPreferences.getString('access')}',
        },
      ),
    );
    if (response.statusCode == 200) {
      var cartResponse = cartFromJson(jsonEncode(response.data));
      print(MyApp.sharedPreferences.getString('access'));
      return cartResponse;
    } else {
      throw Exception('erorr');
    }
  }
}
