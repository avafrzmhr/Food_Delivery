part of 'filter_res_foods_bloc.dart';

@immutable
abstract class FilterFoodsState extends Equatable {}

class FilterFoodsInitial extends FilterFoodsState {
  @override
  List<Object?> get props => [];
}

class FilterFoodsLoading extends FilterFoodsState {
  @override
  List<Object?> get props => [];
}

class FilterFoodsSuccess extends FilterFoodsState {
  final List<Menu> menu;
  FilterFoodsSuccess(this.menu);

  @override
  List<Object?> get props => [menu];
}

class FilterFoodsError extends FilterFoodsState {
  final String message;

  FilterFoodsError(this.message);

  @override
  List<Object?> get props => [message];
}
