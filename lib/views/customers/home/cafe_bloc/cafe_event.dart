part of 'cafe_bloc.dart';

@immutable
abstract class CafeEvent extends Equatable {
  const CafeEvent();
}

class LoadCafeEvent extends CafeEvent {
  LoadCafeEvent();
  @override
  List<Object?> get props => [];
}
