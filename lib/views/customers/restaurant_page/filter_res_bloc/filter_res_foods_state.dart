part of 'filter_res_foods_bloc.dart';

@immutable
abstract class FilterRestaurantFoodsState extends Equatable {}

class FilterRestaurantFoodsInitial extends FilterRestaurantFoodsState {
  @override
  List<Object?> get props => [];
}

class FilterRestaurantFoodsLoading extends FilterRestaurantFoodsState {
  @override
  List<Object?> get props => [];
}

class FilterRestaurantFoodsSuccess extends FilterRestaurantFoodsState {
  final List<Menu> menu;
  FilterRestaurantFoodsSuccess(this.menu);

  @override
  List<Object?> get props => [menu];
}

class FilterRestaurantFoodsError extends FilterRestaurantFoodsState {
  final String message;

  FilterRestaurantFoodsError(this.message);

  @override
  List<Object?> get props => [message];
}
