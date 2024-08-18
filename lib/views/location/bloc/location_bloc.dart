import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/data/model/neshan/neshan_response.dart';
import 'package:food_delivery/data/model/neshan/neshan_search_response/neshan_search_response.dart';
import 'package:food_delivery/data/repository/location_repository.dart';
import 'package:food_delivery/main.dart';
import 'package:location/location.dart';
part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationRepository locationRepository;
  LocationBloc(this.locationRepository) : super(LocationInitial()) {
    on<LocationEvent>((event, emit) async {
      log('event is $event ****');
      if (event is LocationStarted) {
        try {
          var locationData = await locationRepository.getLocation();
          // if (locationData != null &&
          //     locationData.latitude != null &&
          //     locationData.longitude != null) {
          var neshanLocation = await locationRepository.getNeshanLocation(
              locationData!.latitude!, locationData.longitude!);

          if (neshanLocation != null) {
            emit(LocationSuccess(
                location: neshanLocation, locationData: locationData));
          } else {
            emit(const LocationError('موقعیت دریافت نشد'));
            // }
          }
        } catch (e) {
          log(e.toString());
          emit(LocationError(e.toString()));
        }
      }
      if (event is LocationChanged) {
        try {
          var neshanLocation =
              await locationRepository.setLocation(event.lat, event.lang);
          if (neshanLocation != null) {
            var locationData = LocationData.fromMap(
                {'latitude': event.lat, 'longitude': event.lang});
            log(locationData.toString());
            MyApp.sharedPreferences.setString('City', neshanLocation.city!);
            MyApp.sharedPreferences
                .setString('Address', neshanLocation.formattedAddress!);
            emit(
              LocationSuccess(
                  location: neshanLocation, locationData: locationData),
            );
          }
        } catch (e) {
          emit(LocationError(e.toString()));
        }
      } else {
        log('event is $event ********');
      }
    });
  }
}
