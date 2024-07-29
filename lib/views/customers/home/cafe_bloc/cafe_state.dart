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

// class CafeSuccess extends CafeState {
//   // final Cafe Cafes;
//   // CafeSuccess(this.Cafes);

//   // @override
//   // List<Object?> get props => [Cafes];
// }

class CafeError extends CafeState {
  final String message;

  CafeError(this.message);

  @override
  List<Object?> get props => [message];
}
