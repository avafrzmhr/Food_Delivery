part of 'restaurant_bloc.dart';

@immutable
abstract class OwnerRestaurantState extends Equatable {}

class OwnerRestaurantInitial extends OwnerRestaurantState {
  @override
  List<Object?> get props => [];
}

class OwnerRestaurantLoading extends OwnerRestaurantState {
  @override
  List<Object?> get props => [];
}

class OwnerRestaurantSuccess extends OwnerRestaurantState {
  final Restaurant restaurant;
  OwnerRestaurantSuccess(this.restaurant);

  @override
  List<Object?> get props => [restaurant];
}

class OwnerRestaurantError extends OwnerRestaurantState {
  final String message;

  OwnerRestaurantError(this.message);

  @override
  List<Object?> get props => [message];
}
