part of 'owner_register_bloc.dart';

@immutable
abstract class OwnerRegisterState extends Equatable {}

class OwnerRegisterInitial extends OwnerRegisterState {
  @override
  List<Object?> get props => [];
}

class OwnerRegisterLoading extends OwnerRegisterState {
  @override
  List<Object?> get props => [];
}

class OwnerRegisterSuccess extends OwnerRegisterState {
  @override
  List<Object?> get props => [];
}

class OwnerRegisterError extends OwnerRegisterState {
  final String message;

  OwnerRegisterError(this.message);

  @override
  List<Object?> get props => [message];
}
