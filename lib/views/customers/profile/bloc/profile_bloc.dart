import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/model/customer/profile.dart';
import 'package:food_delivery/data/repository/customer_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class CustomerProfileBloc
    extends Bloc<CustomerProfileEvent, CustomerProfileState> {
  CustomerProfileBloc() : super(CustomerProfileInitial()) {
    on<CustomerProfileEvent>((event, emit) async {
      CustomerRepository customerRepository = CustomerRepository();
      if (event is LoadCustomerProfile) {
        try {
          final res = await customerRepository.customerProfile();
          print(res);
          emit(CustomerProfileSuccess(res));
        } catch (e) {
          emit(CustomerProfileError(e.toString()));
        }
      } else if (event is EditProfile) {
        try {
          final res = await customerRepository.editProfile(
              event.id, event.name, event.lastName, event.email);
          print(res);
          emit(CustomerProfileEditSuccess());
        } catch (e) {
          emit(CustomerProfileError(e.toString()));
        }
      }
    });
  }
}
