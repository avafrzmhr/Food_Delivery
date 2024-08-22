part of 'cafe_bloc.dart';

@immutable
abstract class CafeState extends Equatable {}

class CafeInitial extends CafeState {
  @override
  List<Object?> get props => [];
}

class CafeLoading extends CafeState {
  @override
  List<Object?> get props => [];
}

class CafeSuccess extends CafeState {
  final Restaurant cafe;
  CafeSuccess(this.cafe);

  @override
  List<Object?> get props => [cafe];
}

class CafeError extends CafeState {
  final String message;

  CafeError(this.message);

  @override
  List<Object?> get props => [message];
}
