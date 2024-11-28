part of 'favorite_list_bloc.dart';

@immutable
abstract class FavoriteListEvent extends Equatable {
  const FavoriteListEvent();
}

class LoadFavoriteListEvent extends FavoriteListEvent {
  const LoadFavoriteListEvent();
  @override
  List<Object?> get props => [];
}
