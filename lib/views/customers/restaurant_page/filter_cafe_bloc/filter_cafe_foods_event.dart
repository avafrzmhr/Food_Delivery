part of 'filter_cafe_foods_bloc.dart';

@immutable
abstract class FilterCafeFoodsEvent extends Equatable {
  const FilterCafeFoodsEvent();
}

class LoadFilterCafeFoodsEvent extends FilterCafeFoodsEvent {
  final String categoryName;
  final int id;
  const LoadFilterCafeFoodsEvent(this.categoryName, this.id);
  @override
  List<Object?> get props => [categoryName, id];
}

class ResetFilterCafeFoodsEvent extends FilterCafeFoodsEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
