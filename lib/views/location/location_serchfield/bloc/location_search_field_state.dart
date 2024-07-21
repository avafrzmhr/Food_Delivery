part of 'location_search_field_bloc.dart';

abstract class LocationSearchFieldState extends Equatable {
  const LocationSearchFieldState();

  @override
  List<Object> get props => [];
}

class LocationSearchFieldInitial extends LocationSearchFieldState {
  @override
  List<Object> get props => [];
}

class LocationSearchFieldLoading extends LocationSearchFieldState {
  @override
  List<Object> get props => [];
}

class LocationSearchFieldSuccess extends LocationSearchFieldState {
  final List<Item> response;

  const LocationSearchFieldSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class LocationSearchFieldError extends LocationSearchFieldState {
  final String message;

  const LocationSearchFieldError(this.message);

  @override
  List<Object> get props => [message];
}
