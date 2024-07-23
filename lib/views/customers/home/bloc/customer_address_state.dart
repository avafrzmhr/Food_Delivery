part of 'customer_address_bloc.dart';

@immutable
abstract class CustomerAddressState extends Equatable {}

class CustomerAddressInitial extends CustomerAddressState {
  @override
  List<Object?> get props => [];
}

class CustomerAddressLoading extends CustomerAddressState {
  @override
  List<Object?> get props => [];
}

class CustomerAddressSuccess extends CustomerAddressState {
  CustomerAddressSuccess();

  @override
  List<Object?> get props => [];
}

class CustomerAddressError extends CustomerAddressState {
  final String message;

  CustomerAddressError(this.message);

  @override
  List<Object?> get props => [message];
}
