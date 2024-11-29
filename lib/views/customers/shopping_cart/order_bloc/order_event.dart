part of 'order_bloc.dart';

@immutable
abstract class OrderEvent extends Equatable {
  const OrderEvent();
}

class LoadOrderEvent extends OrderEvent {
  final int id;
  const LoadOrderEvent(this.id);
  @override
  List<Object?> get props => [id];
}
