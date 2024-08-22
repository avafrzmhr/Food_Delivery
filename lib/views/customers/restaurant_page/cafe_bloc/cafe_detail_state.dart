part of 'cafe_detail_bloc.dart';

@immutable
abstract class CafeDetailState extends Equatable {}

class CafeDetailInitial extends CafeDetailState {
  @override
  List<Object?> get props => [];
}

class CafeDetailLoading extends CafeDetailState {
  @override
  List<Object?> get props => [];
}

class CafeDetailSuccess extends CafeDetailState {
  final List<Menu> menu;
  CafeDetailSuccess(this.menu);

  @override
  List<Object?> get props => [menu];
}

class CafeDetailError extends CafeDetailState {
  final String message;

  CafeDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
