part of 'payment_bloc.dart';

@immutable
abstract class PaymentEvent extends Equatable {
  const PaymentEvent();
}

class LoadPaymentEvent extends PaymentEvent {
  final int orderId;
  const LoadPaymentEvent(this.orderId);
  @override
  List<Object?> get props => [orderId];
}
