part of 'add_to_cart_bloc.dart';

@immutable
abstract class AddToCartState extends Equatable {}

class AddToCartInitial extends AddToCartState {
  @override
  List<Object?> get props => [];
}

class AddToCartLoading extends AddToCartState {
  @override
  List<Object?> get props => [];
}

class AddToCartSuccess extends AddToCartState {
  AddToCartSuccess();

  @override
  List<Object?> get props => [];
}

class AddToCartError extends AddToCartState {
  final String message;

  AddToCartError(this.message);

  @override
  List<Object?> get props => [message];
}
