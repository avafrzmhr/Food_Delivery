import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:food_delivery/data/model/restaurant/category_model.dart';
import 'package:food_delivery/data/model/restaurant/menu_response.dart';
import 'package:food_delivery/data/model/restaurant/restaurant_response.dart';
import 'package:food_delivery/main.dart';

class OwnerDataSource {
  Dio dio = Dio();

  Future<Response> addRestaurant(
    Uint8List image,
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
    try {
      String fileName = "restaurant_image.jpg"; // Default name for the image
      FormData formData = FormData.fromMap({
        "image": MultipartFile.fromBytes(image, filename: fileName),
        "category": category,
        "delivery_time": deliveryTime,
        "min_cart_price": minCartPrice,
        "delivery_price": deliveryPrice,
        "name": name,
        "phone_number": phoneNumber,
        "open_time": openTime,
        "close_time": closeTime,
        "address_name": address,
        "latitude": lat,
        "longitude": long,
      });

      Response response = await Dio().post(
        'http://127.0.0.1:8000/core/res/',
        options: Options(
          headers: {
            'Authorization':
                'JWT ${MyApp.sharedPreferences.getString('access')}',
          },
        ),
        data: formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else {
        print("Failed with status code: ${response.statusCode}");
        print("Response data: ${response.data}");
        throw Exception('Error uploading food item');
      }
    } on DioException catch (e) {
      print("DioException caught: ${e.message}");
      print("Response data: ${e.response?.data}");
      throw e;
    }
  }

  Future<List<Menu>> fetchRestaurantFoods() async {
    Response response = await dio.get(
      'http://127.0.0.1:8000/core/add_food/',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'JWT ${MyApp.sharedPreferences.getString('access')}',
        },
      ),
    );
    if (response.statusCode == 200) {
      var foodResponse = menuFromJson(jsonEncode(response.data));
      print(MyApp.sharedPreferences.getString('access'));
      return foodResponse;
    } else {
      throw Exception('erorr');
    }
  }

  Future<Restaurant> fetchRestaurant() async {
    Response response = await dio.get(
      'http://127.0.0.1:8000/core/res',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'JWT ${MyApp.sharedPreferences.getString('access')}',
        },
      ),
    );
    if (response.statusCode == 200) {
      String jsonString = jsonEncode(response.data);
      String wrappedJsonResponse = '{"data": $jsonString}';
      var restaurantResponse = restaurantFromJson(wrappedJsonResponse);
      return restaurantResponse;
    } else {
      throw Exception('Error fetching restaurant data');
    }
  }

  Future<Response> addFood(
    Uint8List image,
    String name,
    String desc,
    int category,
    double price,
  ) async {
    try {
      String fileName = 'food_image.jpg';

      FormData formData = FormData.fromMap({
        "image": MultipartFile.fromBytes(image, filename: fileName),
        "food_category": category,
        "name": name,
        "desc": desc,
        "price": price,
      });

      Response response = await Dio().post(
        'http://127.0.0.1:8000/core/add_food/',
        options: Options(
          headers: {
            'Authorization':
                'JWT ${MyApp.sharedPreferences.getString('access')}',
          },
        ),
        data: formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else {
        print("Failed with status code: ${response.statusCode}");
        print("Response data: ${response.data}");
        throw Exception('Error uploading food item');
      }
    } on DioException catch (e) {
      print("DioException caught: ${e.message}");
      print("Response data: ${e.response?.data}");
      throw e;
    }
  }

  Future<List<CategoryModel>> fetchCategory() async {
    Response response = await dio.get(
      'http://127.0.0.1:8000/core/food_category/',
      options: Options(
        headers: {
          'Authorization': 'JWT ${MyApp.sharedPreferences.getString('access')}',
        },
      ),
    );
    if (response.statusCode == 200) {
      List<CategoryModel> categoryList =
          categoryFromJson(jsonEncode(response.data));
      return categoryList;
    } else {
      print("Failed with status code: ${response.statusCode}");
      print("Response data: ${response.data}");
      throw Exception('Error getting category');
    }
  }
}
