part of 'add_restaurant_bloc.dart';

@immutable
abstract class AddRestaurantState extends Equatable {}

class AddRestaurantInitial extends AddRestaurantState {
  @override
  List<Object?> get props => [];
}

class AddRestaurantLoading extends AddRestaurantState {
  @override
  List<Object?> get props => [];
}

class AddRestaurantSuccess extends AddRestaurantState {
  AddRestaurantSuccess();

  @override
  List<Object?> get props => [];
}

class AddRestaurantError extends AddRestaurantState {
  final String message;

  AddRestaurantError(this.message);

  @override
  List<Object?> get props => [message];
}
