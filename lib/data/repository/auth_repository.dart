import 'package:dio/dio.dart';
import 'package:food_delivery/data/source/auth_data_source.dart';

abstract class IAuthRepository {
  Future<Response> register(String name, String lastName, String phoneNumber);
}

class AuthRepository implements IAuthRepository {
  @override
  Future<Response> register(
      String name, String lastName, String phoneNumber) async {
    var registerResponse =
        await AuthDataSource().register(name, lastName, phoneNumber);
    return registerResponse;
  }
}
