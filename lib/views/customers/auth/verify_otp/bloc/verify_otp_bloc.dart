import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/auth_repository.dart';
import 'package:food_delivery/main.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  AuthRepository authRepository;
  VerifyOtpBloc(this.authRepository) : super(VerifyOtpInitial()) {
    on<VerifyOtpEvent>((event, emit) async {
      if (event is VerifyOtpRequestEvent) {
        final res =
            await authRepository.verifyOtp(event.phoneNu, event.otpCode);
        if (res.statusCode == 200) {
          print(res);
          print(res.data);
          MyApp.sharedPreferences.setString('refresh', res.data['refresh']);
          MyApp.sharedPreferences.setString('access', res.data['access']);
          MyApp.sharedPreferences.setBool('isOwner', res.data['is_owner']);

          emit(VerifyOtpSuccess());
        } else {
          emit(VerifyOtpError(res.statusMessage.toString()));
        }
      }
    });
  }
}
