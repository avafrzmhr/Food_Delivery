part of 'menu_foods_bloc.dart';

@immutable
abstract class MenuFoodsEvent extends Equatable {
  const MenuFoodsEvent();
}

class LoadMenuFoodsEvent extends MenuFoodsEvent {
  const LoadMenuFoodsEvent();
  @override
  List<Object?> get props => [];
}
