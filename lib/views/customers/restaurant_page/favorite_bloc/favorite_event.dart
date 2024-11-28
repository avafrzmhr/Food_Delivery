part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class AddFavorite extends FavoriteEvent {
  final int resID;
  const AddFavorite(this.resID);
  @override
  List<Object?> get props => [resID];
}

class DelFavorite extends FavoriteEvent {
  final int id;
  const DelFavorite(this.id);
  @override
  List<Object?> get props => [id];
}
