part of 'profile_bloc.dart';

@immutable
abstract class CustomerProfileState extends Equatable {}

class CustomerProfileInitial extends CustomerProfileState {
  @override
  List<Object?> get props => [];
}

class CustomerProfileLoading extends CustomerProfileState {
  @override
  List<Object?> get props => [];
}

class CustomerProfileSuccess extends CustomerProfileState {
  final List<Profile> profile;
  CustomerProfileSuccess(this.profile);

  @override
  List<Object?> get props => [];
}

class CustomerProfileEditSuccess extends CustomerProfileState {
  CustomerProfileEditSuccess();

  @override
  List<Object?> get props => [];
}

class CustomerProfileError extends CustomerProfileState {
  final String message;

  CustomerProfileError(this.message);

  @override
  List<Object?> get props => [message];
}
