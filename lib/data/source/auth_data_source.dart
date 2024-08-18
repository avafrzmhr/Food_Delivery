import 'package:dio/dio.dart';

class AuthDataSource {
  Dio dio = Dio();
  Future<Response> customerRegister(
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

  Future<Response> verifyOtp(String phoneNumber, String otpCode) async {
    Response response = await dio.post(
      "http://127.0.0.1:8000/account/verify/",
      data: {
        'phone_number': phoneNumber,
        'otp': otpCode,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    return response;
  }

  Future<Response> login(String phoneNumber) async {
    Response response = await dio.post(
      "http://127.0.0.1:8000/account/login/",
      data: {
        'phone_number': phoneNumber,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer ${MyApp.sharedPreferences.getString('access')}',
        },
      ),
    );
    return response;
  }

  Future<Response> ownerRegister(
    String name,
    String lastName,
    String phoneNumber,
    String email,
    String storeName,
    String storeType,
    String storeDesc,
  ) async {
    try {
      Response response = await dio.post(
        "http://127.0.0.1:8000/account/owner_register/",
        data: {
          "phone_number": phoneNumber,
          "name": name,
          "last_name": lastName,
          "email": email,
          "stores_name": storeName,
          "storetype_name": storeType,
          "storetype_desc": storeDesc
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      return response;
    } on DioError catch (e) {
      // Handle DioError here
      print('DioError: ${e.message}');
      if (e.response != null) {
        print('Response data: ${e.response?.data}');
        print('Response headers: ${e.response?.headers}');
      } else {
        print('Error sending request: ${e.message}');
      }
      rethrow; // Optionally rethrow the error
    } catch (e) {
      // Handle other types of errors
      print('Error: ${e.toString()}');
      rethrow; // Optionally rethrow the error
    }
  }
}
