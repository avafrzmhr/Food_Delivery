import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'cafe_event.dart';
part 'cafe_state.dart';

class CafeBloc extends Bloc<CafeEvent, CafeState> {
  CafeBloc() : super(CafeInitial()) {
    on<CafeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
