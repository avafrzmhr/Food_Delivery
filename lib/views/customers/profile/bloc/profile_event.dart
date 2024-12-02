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

class EditProfile extends CustomerProfileEvent {
  final int id;
  final String name;
  final String lastName;
  final String email;
  const EditProfile(this.id, this.name, this.lastName, this.email);
  @override
  List<Object?> get props => [id, name, lastName, email];
}
