import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/customer_repository.dart';

part 'customer_address_event.dart';
part 'customer_address_state.dart';

class CustomerAddressBloc
    extends Bloc<CustomerAddressEvent, CustomerAddressState> {
  CustomerAddressBloc() : super(CustomerAddressInitial()) {
    on<CustomerAddressEvent>((event, emit) async {
      CustomerRepository customerRepository = CustomerRepository();
      if (event is CustomerAddressRequestEvent) {
        try {
          final res = await customerRepository.customerAddress(
              event.addressName, event.lat, event.long);
          if (res.statusCode == 200) {
            emit(CustomerAddressSuccess());
          } else {
            emit(CustomerAddressError('errorrr'));
          }
        } catch (e) {
          emit(CustomerAddressError('errorrr'));
        }
      }
    });
  }
}
