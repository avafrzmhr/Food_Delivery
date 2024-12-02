import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:food_delivery/data/model/customer/profile.dart';
import 'package:food_delivery/data/model/restaurant/menu_response.dart';
import 'package:food_delivery/data/model/restaurant/restaurant_response.dart';
import 'package:food_delivery/main.dart';

class CustomerDataSource {
  Dio dio = Dio();

  Future<List<Profile>> getProfile() async {
    Response response = await dio.get(
      'http://127.0.0.1:8000/account/customer_profile/',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'JWT ${MyApp.sharedPreferences.getString('access')}',
        },
      ),
    );
    if (response.statusCode == 200) {
      var profileResponse = profileFromJson(jsonEncode(response.data));
      return profileResponse;
    } else {
      throw Exception('erorr');
    }
  }

  Future<Response> editProfile(
      int id, String name, String lastName, String email) async {
    Response response =
        await dio.put('http://127.0.0.1:8000/account/customer_profile/$id/',
            options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Authorization':
                    'JWT ${MyApp.sharedPreferences.getString('access')}',
              },
            ),
            data: {
          "name": name,
          "last_name": lastName,
          "email": email,
        });
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('erorr');
    }
  }

  Future<Response> customerAddress(
      String addressName, double lat, double long) async {
    Response response1 = await dio.get(
      'http://127.0.0.1:8000/account/customer_address/',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'JWT ${MyApp.sharedPreferences.getString('access')}',
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
          'Authorization': 'JWT ${MyApp.sharedPreferences.getString('access')}',
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
          'Authorization': 'JWT ${MyApp.sharedPreferences.getString('access')}',
        },
      ),
    );
    if (response.statusCode == 200) {
      var restaurantResponse = restaurantFromJson(jsonEncode(response.data));
      print(MyApp.sharedPreferences.getString('access'));
      return restaurantResponse;
    } else {
      throw Exception('erorr');
    }
  }

  Future<Restaurant> fetchCafe() async {
    Response response = await dio.get(
      'http://127.0.0.1:8000/customer/cofes',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'JWT ${MyApp.sharedPreferences.getString('access')}',
        },
      ),
    );
    if (response.statusCode == 200) {
      var restaurantResponse = restaurantFromJson(jsonEncode(response.data));
      print(MyApp.sharedPreferences.getString('access'));
      return restaurantResponse;
    } else {
      throw Exception('erorr');
    }
  }

  Future<List<Menu>> fetchRestaurantFoods(int id) async {
    Response response = await dio.get(
      'http://127.0.0.1:8000/customer/restaurants/$id/foods',
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

  Future<List<Menu>> fetchCafeFoods(int id) async {
    Response response = await dio.get(
      'http://127.0.0.1:8000/customer/cofes/$id/foods',
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

  Future<List<Menu>> filterRestaurantFoods(String categoryName, int id) async {
    Response response = await dio.get(
      'http://127.0.0.1:8000/customer/restaurants/$id/foods/?food_category__category_name=$categoryName',
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

  Future<List<Menu>> filterCafeFoods(String categoryName, int id) async {
    Response response = await dio.get(
      'http://127.0.0.1:8000/customer/cofes/$id/foods/?food_category__category_name=$categoryName',
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

  Future<Response> addToFavorite(int resID) async {
    Response response = await dio.post(
      'http://127.0.0.1:8000/customer/restaurants/$resID/favorite/',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'JWT ${MyApp.sharedPreferences.getString('access')}',
        },
      ),
      data: {},
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('erorr');
    }
  }

  Future<Response> getFavorites() async {
    Response response = await dio.get(
      'http://127.0.0.1:8000/customer/myfavorites',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'JWT ${MyApp.sharedPreferences.getString('access')}',
        },
      ),
      data: {},
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('erorr');
    }
  }

  Future<Response> removeFavorite(int id) async {
    Response response = await dio.delete(
      'http://127.0.0.1:8000/customer/myfavorites/$id',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'JWT ${MyApp.sharedPreferences.getString('access')}',
        },
      ),
      data: {},
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('erorr');
    }
  }
}
