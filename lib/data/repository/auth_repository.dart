import 'package:dio/dio.dart';
import 'package:food_delivery/data/source/auth_data_source.dart';

abstract class IAuthRepository {
  Future<Response> register(String name, String lastName, String phoneNumber);
  Future<Response> verifyOtp(String phoneNumber, String otpCode);
}

class AuthRepository implements IAuthRepository {
  final AuthDataSource authDataSource;
  AuthRepository(this.authDataSource);
  @override
  Future<Response> register(
      String name, String lastName, String phoneNumber) async {
    var registerResponse =
        await AuthDataSource().register(name, lastName, phoneNumber);
    return registerResponse;
  }

  @override
  Future<Response> verifyOtp(String phoneNumber, String otpCode) async {
    var otpResponse = await AuthDataSource().verifyOtp(phoneNumber, otpCode);
    return otpResponse;
  }
}
