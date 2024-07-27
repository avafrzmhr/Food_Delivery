part of 'restaurant_detail_bloc.dart';

@immutable
abstract class RestaurantDetailState extends Equatable {}

class RestaurantDetailInitial extends RestaurantDetailState {
  @override
  List<Object?> get props => [];
}

class RestaurantDetailLoading extends RestaurantDetailState {
  @override
  List<Object?> get props => [];
}

class RestaurantDetailSuccess extends RestaurantDetailState {
  final List<Menu> menu;
  RestaurantDetailSuccess(this.menu);

  @override
  List<Object?> get props => [menu];
}

class RestaurantDetailError extends RestaurantDetailState {
  final String message;

  RestaurantDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
