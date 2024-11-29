part of 'add_to_cart_bloc.dart';

@immutable
abstract class AddToCartEvent extends Equatable {
  const AddToCartEvent();
}

class AddingEvent extends AddToCartEvent {
  final int id;
  const AddingEvent(this.id);
  @override
  List<Object?> get props => [id];
}
