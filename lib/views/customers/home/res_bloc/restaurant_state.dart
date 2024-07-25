part of 'restaurant_bloc.dart';

@immutable
abstract class RestaurantState extends Equatable {}

class RestaurantInitial extends RestaurantState {
  @override
  List<Object?> get props => [];
}

class RestaurantLoading extends RestaurantState {
  @override
  List<Object?> get props => [];
}

class RestaurantSuccess extends RestaurantState {
  final Restaurant restaurants;
  RestaurantSuccess(this.restaurants);

  @override
  List<Object?> get props => [restaurants];
}

class RestaurantError extends RestaurantState {
  final String message;

  RestaurantError(this.message);

  @override
  List<Object?> get props => [message];
}
