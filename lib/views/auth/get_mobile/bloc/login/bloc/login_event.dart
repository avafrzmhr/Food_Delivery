part of 'login_bloc.dart';

abstract class LoginEvent {}

class SubmitLoginEvent extends LoginEvent {
  String phoneNumber;

  SubmitLoginEvent(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}
