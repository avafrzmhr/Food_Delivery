part of 'payment_bloc.dart';

@immutable
abstract class PaymentEvent extends Equatable {
  const PaymentEvent();
}

class AddPaymentEvent extends PaymentEvent {
  final int orderId;
  final String cardNum;
  final String cvv2;
  const AddPaymentEvent(this.orderId, this.cardNum, this.cvv2);
  @override
  List<Object?> get props => [orderId, cardNum, cvv2];
}

class VerifyPayment extends PaymentEvent {
  final int orderId;
  final String cardNum;
  final String cvv2;
  final String dynamicPass;
  final String verification;

  const VerifyPayment(this.orderId, this.cardNum, this.cvv2, this.dynamicPass,
      this.verification);
  @override
  List<Object?> get props =>
      [orderId, cardNum, cvv2, dynamicPass, verification];
}
