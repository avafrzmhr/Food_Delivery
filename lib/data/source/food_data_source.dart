// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:food_delivery/data/model/restaurant/menu_response.dart';
// import 'package:food_delivery/main.dart';

// class FoodDataSource{
//   Dio dio = Dio();
  
//   Future<List<Menu>> (int id) async {
//     Response response = await dio.get(
//       'http://127.0.0.1:8000/customer/restaurants/$id/foods',
//       options: Options(
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'JWT ${MyApp.sharedPreferences.getString('access')}',
//         },
//       ),
//     );
//     if (response.statusCode == 200) {
//       var foodResponse = menuFromJson(jsonEncode(response.data));
//       print(MyApp.sharedPreferences.getString('access'));
//       return foodResponse;
//     } else {
//       throw Exception('erorr');
//     }
//   }
// }