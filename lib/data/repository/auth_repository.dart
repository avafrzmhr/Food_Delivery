import 'package:dio/dio.dart';
import 'package:food_delivery/data/source/auth_data_source.dart';

abstract class IAuthRepository {
  Future<Response> customerRegister(
      String name, String lastName, String phoneNumber);
  Future<Response> verifyOtp(String phoneNumber, String otpCode);
  Future<Response> login(String phoneNumber);
  Future<Response> ownerRegister(
      String name,
      String lastName,
      String phoneNumber,
      String email,
      String storeName,
      String storeType,
      String storeDesc);
}

class AuthRepository implements IAuthRepository {
  final AuthDataSource authDataSource;
  AuthRepository(this.authDataSource);
  @override
  Future<Response> customerRegister(
      String name, String lastName, String phoneNumber) async {
    var registerResponse =
        await AuthDataSource().customerRegister(name, lastName, phoneNumber);
    return registerResponse;
  }

  @override
  Future<Response> verifyOtp(String phoneNumber, String otpCode) async {
    var otpResponse = await AuthDataSource().verifyOtp(phoneNumber, otpCode);
    return otpResponse;
  }

  @override
  Future<Response> login(String phoneNumber) async {
    var loginResponse = await AuthDataSource().login(phoneNumber);
    return loginResponse;
  }

  @override
  Future<Response> ownerRegister(
      String name,
      String lastName,
      String phoneNumber,
      String email,
      String storeName,
      String storeType,
      String storeDesc) async {
    var registerResponse = await AuthDataSource().ownerRegister(
        name, lastName, phoneNumber, email, storeName, storeType, storeDesc);
    return registerResponse;
  }
}
