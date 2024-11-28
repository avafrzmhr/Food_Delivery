part of 'profile_bloc.dart';

@immutable
abstract class CustomerProfileEvent extends Equatable {
  const CustomerProfileEvent();
}

class LoadCustomerProfile extends CustomerProfileEvent {
  const LoadCustomerProfile();
  @override
  List<Object?> get props => [];
}
