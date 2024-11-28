part of 'payment_bloc.dart';

@immutable
abstract class PaymentState extends Equatable {}

class PaymentInitial extends PaymentState {
  @override
  List<Object?> get props => [];
}

class PaymentLoading extends PaymentState {
  @override
  List<Object?> get props => [];
}

class PaymentSuccess extends PaymentState {
  PaymentSuccess();

  @override
  List<Object?> get props => [];
}

class PaymentError extends PaymentState {
  final String message;

  PaymentError(this.message);

  @override
  List<Object?> get props => [message];
}
