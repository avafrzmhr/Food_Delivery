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
  final List<dynamic> restaurants;
  final List<dynamic> cafes;

  RestaurantSuccess({required this.restaurants, required this.cafes});

  @override
  List<Object?> get props => [restaurants, cafes];
}

class RestaurantError extends RestaurantState {
  final String message;

  RestaurantError(this.message);

  @override
  List<Object?> get props => [message];
}
