part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();
}

class LocationStarted extends LocationEvent {
  @override
  List<Object> get props => [];
}

class LocationChanged extends LocationEvent {
  final double lat;
  final double lang;
  // final String city;

  const LocationChanged({required this.lat, required this.lang});
  @override
  List<Object> get props => [];
}

class LocationSearch extends LocationEvent {
  final String address;

  const LocationSearch(this.address);
  @override
  List<Object> get props => [address];
}
