part of 'filter_cafe_foods_bloc.dart';

@immutable
abstract class FilterCafeFoodsState extends Equatable {}

class FilterCafeFoodsInitial extends FilterCafeFoodsState {
  @override
  List<Object?> get props => [];
}

class FilterCafeFoodsLoading extends FilterCafeFoodsState {
  @override
  List<Object?> get props => [];
}

class FilterCafeFoodsSuccess extends FilterCafeFoodsState {
  final List<Menu> menu;
  FilterCafeFoodsSuccess(this.menu);

  @override
  List<Object?> get props => [menu];
}

class FilterCafeFoodsError extends FilterCafeFoodsState {
  final String message;

  FilterCafeFoodsError(this.message);

  @override
  List<Object?> get props => [message];
}
