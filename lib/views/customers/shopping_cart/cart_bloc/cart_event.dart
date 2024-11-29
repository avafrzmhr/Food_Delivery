part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();
}

class LoadCartEvent extends CartEvent {
  const LoadCartEvent();
  @override
  List<Object?> get props => [];
}
