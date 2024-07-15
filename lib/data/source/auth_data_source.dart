import 'package:dio/dio.dart';

class AuthDataSource {
  Dio dio = Dio();
  Future<Response> register(
      String name, String lastName, String phoneNumber) async {
    Response response = await dio.post(
      "http://127.0.0.1:8000/account/customer_register/",
      data: {
        'name': name,
        'last_name': lastName,
        'phone_number': phoneNumber,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    return response;
  }
}
