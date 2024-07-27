part of 'restaurant_detail_bloc.dart';

@immutable
abstract class RestaurantDetailEvent extends Equatable {
  const RestaurantDetailEvent();
}

class LoadRestaurantDetailEvent extends RestaurantDetailEvent {
  final int id;
  const LoadRestaurantDetailEvent(this.id);
  @override
  List<Object?> get props => [id];
}
