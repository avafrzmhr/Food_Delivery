part of 'menu_foods_bloc.dart';

@immutable
abstract class MenuFoodsState extends Equatable {}

class MenuFoodsInitial extends MenuFoodsState {
  @override
  List<Object?> get props => [];
}

class MenuFoodsLoading extends MenuFoodsState {
  @override
  List<Object?> get props => [];
}

class MenuFoodsSuccess extends MenuFoodsState {
  final List<Menu> menu;
  MenuFoodsSuccess(this.menu);

  @override
  List<Object?> get props => [menu];
}

class MenuFoodsError extends MenuFoodsState {
  final String message;

  MenuFoodsError(this.message);

  @override
  List<Object?> get props => [message];
}
