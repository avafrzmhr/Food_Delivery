part of 'filter_res_foods_bloc.dart';

@immutable
abstract class FilterFoodsEvent extends Equatable {
  const FilterFoodsEvent();
}

class FilterByCategoryEvent extends FilterFoodsEvent {
  final String categoryName;
  final int id;
  final bool isCafe;

  const FilterByCategoryEvent(this.categoryName, this.id, this.isCafe);

  @override
  List<Object?> get props => [categoryName, id, isCafe];
}

// class LoadFilterCafeFoodsEvent extends FilterFoodsEvent {
//   final String categoryName;
//   final int id;
//   const LoadFilterCafeFoodsEvent(this.categoryName, this.id);
//   @override
//   List<Object?> get props => [categoryName, id];
// }

class ResetFilterFoodsEvent extends FilterFoodsEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
