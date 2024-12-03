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
    try {
      Response response = await dio.post(
        'http://127.0.0.1:8000/cart/payment/',
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
        },
      );

      // Check if status code is 200 or 201
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else {
        throw Exception('Unexpected status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw e;
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

  Future<OrderModel> putOrderAddress(
      int id, String address, double lat, double long, int orderID) async {
    Response response = await dio.put(
      'http://127.0.0.1:8000/cart/carts/$id/order/$orderID/',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'JWT ${MyApp.sharedPreferences.getString('access')}',
        },
      ),
      data: {
        "delivery_address_name": address,
        "latitude": lat,
        "longitude": long,
      },
    );
    if (response.statusCode == 200) {
      var res = orderModelFromJson(jsonEncode(response.data));
      return res;
    } else {
      throw Exception('erorr');
    }
  }

  Future<Response> verifyPayment(int orderID, String cardNum, String cvv2,
      String dynamicPass, String verification) async {
    Response response = await dio.post(
      'http://127.0.0.1:8000/cart/verifypayment/',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'JWT ${MyApp.sharedPreferences.getString('access')}',
        },
        validateStatus: (status) {
          return status != null && status < 600; // Allow handling 400 manually
        },
      ),
      data: {
        "order_id": orderID,
        "origin_card_number": cardNum,
        "cvv2": cvv2,
        "dynamic_password": dynamicPass,
        "verification": verification,
      },
    );
    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 500) {
      print('Server Error: ${response.data}');
      throw Exception('Internal Server Error: ${response.data}');
    } else {
      // Log detailed error
      print('Error Response: ${response.data}');
      throw Exception('Error: ${response.data}');
    }
  }
}
