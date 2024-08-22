part of 'cafe_detail_bloc.dart';

@immutable
abstract class CafeDetailEvent extends Equatable {
  const CafeDetailEvent();
}

class LoadCafeDetailEvent extends CafeDetailEvent {
  final int id;
  const LoadCafeDetailEvent(this.id);
  @override
  List<Object?> get props => [id];
}
