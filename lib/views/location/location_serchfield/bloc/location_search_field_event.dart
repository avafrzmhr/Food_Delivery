part of 'location_search_field_bloc.dart';

abstract class LocationSearchFieldEvent extends Equatable {
  const LocationSearchFieldEvent();

  @override
  List<Object> get props => [];
}

class LoactionSearchFieldEditEvent extends LocationSearchFieldEvent {
  final NeshanSearchAddressRequest request;

  const LoactionSearchFieldEditEvent(this.request);
  @override
  List<Object> get props => [request];
}
