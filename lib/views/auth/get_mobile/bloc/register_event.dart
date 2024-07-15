part of 'register_bloc.dart';

abstract class RegisterEvent {}

class SubmitRegisterEvent extends RegisterEvent {
  String name;
  String lastName;
  String phoneNumber;

  SubmitRegisterEvent(this.name, this.lastName, this.phoneNumber);

  @override
  List<Object?> get props => [name, lastName, phoneNumber];
}
