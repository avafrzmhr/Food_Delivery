part of 'restaurant_bloc.dart';

@immutable
abstract class OwnerRestaurantEvent extends Equatable {
  const OwnerRestaurantEvent();
}

class LoadOwnerRestaurantEvent extends OwnerRestaurantEvent {
  LoadOwnerRestaurantEvent();
  @override
  List<Object?> get props => [];
}
