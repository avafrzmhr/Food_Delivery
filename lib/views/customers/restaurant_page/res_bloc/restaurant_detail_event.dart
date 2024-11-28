part of 'restaurant_detail_bloc.dart';

@immutable
abstract class RestaurantDetailEvent extends Equatable {
  const RestaurantDetailEvent();
}

class LoadRestaurantDetailEvent extends RestaurantDetailEvent {
  final int id;
  final bool isCafe;
  const LoadRestaurantDetailEvent(this.id, this.isCafe);
  @override
  List<Object?> get props => [id, isCafe];
}

// class LoadCafeDetailEvent extends RestaurantDetailEvent {
//   final int id;
//   const LoadCafeDetailEvent(this.id);
//   @override
//   List<Object?> get props => [id];
// }
