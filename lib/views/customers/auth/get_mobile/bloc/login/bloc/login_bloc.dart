import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/auth_repository.dart';
import 'package:food_delivery/main.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepository authRepository;
  LoginBloc(this.authRepository) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is SubmitLoginEvent) {
        try {
          emit(LoginLoading());
          final res = await authRepository.login(event.phoneNumber);
          print(res.statusCode);
          if (res.statusCode == 200) {
            MyApp.sharedPreferences
                .setString('phone_number', event.phoneNumber);
            print(res.data);
            emit(LoginSuccess());
          } else {
            emit(LoginError(res.statusMessage.toString()));
          }
        } catch (e) {
          emit(LoginError(e.toString()));
        }
      }
    });
  }
}
