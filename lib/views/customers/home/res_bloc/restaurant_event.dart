part of 'restaurant_bloc.dart';

@immutable
abstract class RestaurantEvent extends Equatable {
  const RestaurantEvent();
}

class LoadDataEvent extends RestaurantEvent {
  final bool loadRestaurants;
  final bool loadCafes;

  const LoadDataEvent({this.loadRestaurants = false, this.loadCafes = false});

  @override
  List<Object?> get props => [loadRestaurants, loadCafes];
}
