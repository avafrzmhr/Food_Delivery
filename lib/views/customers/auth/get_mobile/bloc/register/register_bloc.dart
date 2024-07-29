import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/auth_repository.dart';
import 'package:food_delivery/main.dart';
import 'package:food_delivery/providers.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthRepository authRepository;
  RegisterBloc(this.authRepository) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is SubmitRegisterEvent) {
        try {
          emit(RegisterLoading());
          final res = await authRepository.customerRegister(
              event.name, event.lastName, event.phoneNumber);
          if (res.statusCode == 200) {
            print(res.data);
            MyApp.sharedPreferences
                .setString('phone_number', event.phoneNumber);

            emit(RegisterSuccess());
          } else {
            emit(RegisterError(res.statusMessage.toString()));
          }
        } catch (e) {
          emit(RegisterError(e.toString()));
        }
      }
    });
  }
}
