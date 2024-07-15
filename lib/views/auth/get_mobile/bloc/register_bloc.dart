import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/auth_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      AuthRepository authRepository = AuthRepository();
      if (event is SubmitRegisterEvent) {
        try {
          emit(RegisterLoading());
          final res = await authRepository.register(
              event.name, event.lastName, event.phoneNumber);
          if (res.statusCode == 200) {
            emit(RegisterSuccess());
          } else {
            emit(RegisterError('error in register'));
          }
        } catch (e) {
          emit(RegisterError('error in register'));
        }
      }
    });
  }
}
