import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/auth_repository.dart';
import 'package:food_delivery/data/source/auth_data_source.dart';
import 'package:food_delivery/main.dart';
import 'package:food_delivery/providers.dart';

part 'owner_register_event.dart';
part 'owner_register_state.dart';

class OwnerRegisterBloc extends Bloc<OwnerRegisterEvent, OwnerRegisterState> {
  OwnerRegisterBloc() : super(OwnerRegisterInitial()) {
    on<OwnerRegisterEvent>((event, emit) async {
      AuthRepository authRepository = AuthRepository(AuthDataSource());
      if (event is SubmitOwnerRegisterEvent) {
        try {
          emit(OwnerRegisterLoading());
          final res = await authRepository.ownerRegister(
            event.name,
            event.lastName,
            event.phoneNumber,
            event.email,
            event.storeName,
            event.storeType,
            event.storeDesc,
          );
          if (res.statusCode == 200) {
            print(res.data);
            MyApp.sharedPreferences
                .setString('phone_number', event.phoneNumber);
            emit(OwnerRegisterSuccess());
          } else {
            emit(OwnerRegisterError(res.statusMessage.toString()));
          }
        } catch (e) {
          emit(OwnerRegisterError(e.toString()));
        }
      }
    });
  }
}
