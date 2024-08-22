part of 'filter_res_foods_bloc.dart';

@immutable
abstract class FilterRestaurantFoodsEvent extends Equatable {
  const FilterRestaurantFoodsEvent();
}

class LoadFilterRestaurantFoodsEvent extends FilterRestaurantFoodsEvent {
  final String categoryName;
  final int id;
  const LoadFilterRestaurantFoodsEvent(this.categoryName, this.id);
  @override
  List<Object?> get props => [categoryName, id];
}

class ResetFilterRestaurantFoodsEvent extends FilterRestaurantFoodsEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
