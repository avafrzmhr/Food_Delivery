part of 'register_bloc.dart';

@immutable
abstract class RegisterState extends Equatable {}

class RegisterInitial extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterSuccess extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterError extends RegisterState {
  final String message;

  RegisterError(this.message);

  @override
  List<Object?> get props => [message];
}
