import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/data/model/neshan/neshan_search_address_request.dart';
import 'package:food_delivery/data/model/neshan/neshan_search_response/item.dart';
import 'package:food_delivery/data/repository/location_repository.dart';
part 'location_search_field_event.dart';
part 'location_search_field_state.dart';

class LocationSearchFieldBloc
    extends Bloc<LocationSearchFieldEvent, LocationSearchFieldState> {
  LocationRepository locationRepository;
  LocationSearchFieldBloc(this.locationRepository)
      : super(LocationSearchFieldInitial()) {
    on<LocationSearchFieldEvent>((event, emit) async {
      if (event is LoactionSearchFieldEditEvent) {
        try {
          emit(LocationSearchFieldLoading());
          final items = await locationRepository.searchLocation(event.request);
          emit(LocationSearchFieldSuccess(items));
        } catch (e) {
          log(e.toString());
          emit(const LocationSearchFieldError(''));
        }
      }
    });
  }
}
