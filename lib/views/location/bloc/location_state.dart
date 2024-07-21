part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();
}

class LocationInitial extends LocationState {
  @override
  List<Object> get props => [];
}

class LocationLoading extends LocationState {
  @override
  List<Object> get props => [];
}

class LocationSuccess extends LocationState {
  final NeshanResponse location;
  final LocationData? locationData;

  const LocationSuccess({required this.location, required this.locationData});

  @override
  List<Object?> get props => [location, locationData];
}

class LocationError extends LocationState {
  final String message;

  const LocationError(this.message);
  @override
  List<Object?> get props => [message];
}

class LocationSearchStart extends LocationState {
  @override
  List<Object?> get props => [];
}

class LocationSearchLoading extends LocationState {
  @override
  List<Object?> get props => [];
}

class LocationSearchSuccess extends LocationState {
  final NeshanSearchResponse response;

  const LocationSearchSuccess(this.response);
  @override
  List<Object?> get props => [response];
}

class LocationSearchError extends LocationState {
  final String message;

  const LocationSearchError(this.message);
  @override
  List<Object?> get props => [message];
}
