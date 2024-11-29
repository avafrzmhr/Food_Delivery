import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:food_delivery/data/model/restaurant/cart_response.dart';
import 'package:food_delivery/data/model/restaurant/order_model.dart';
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
      return response;
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

  Future<Response> payment(int orderID, String cardNum, String cvv2) async {
    Response response = await dio.get('http://127.0.0.1:8000/cart/payment/',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'JWT ${MyApp.sharedPreferences.getString('access')}',
          },
        ),
        data: {
          "order_id": orderID,
          "origin_card_number": cardNum,
          "cvv2": cvv2
        });
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('erorr');
    }
  }

  Future<OrderModel> orderPage(int id) async {
    Response response = await dio.get(
      'http://127.0.0.1:8000/cart/carts/$id/order/',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'JWT ${MyApp.sharedPreferences.getString('access')}',
        },
      ),
      data: {},
    );
    if (response.statusCode == 200) {
      var res = orderModelFromJson(jsonEncode(response.data));
      return res;
    } else {
      throw Exception('erorr');
    }
  }
}
