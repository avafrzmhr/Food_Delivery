part of 'restaurant_bloc.dart';

@immutable
abstract class RestaurantEvent extends Equatable {
  const RestaurantEvent();
}

class LoadRestaurantEvent extends RestaurantEvent {
  LoadRestaurantEvent();
  @override
  List<Object?> get props => [];
}
