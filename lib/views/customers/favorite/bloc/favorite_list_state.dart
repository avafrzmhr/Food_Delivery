part of 'favorite_list_bloc.dart';

@immutable
abstract class FavoriteListState extends Equatable {}

class FavoriteListInitial extends FavoriteListState {
  @override
  List<Object?> get props => [];
}

class FavoriteListLoading extends FavoriteListState {
  @override
  List<Object?> get props => [];
}

class FavoriteListSuccess extends FavoriteListState {
  final List<int> id;
  final List<RestaurantModel> restaurant;
  FavoriteListSuccess(this.restaurant, this.id);

  @override
  List<Object?> get props => [restaurant, id];
}

class FavoriteListError extends FavoriteListState {
  final String message;

  FavoriteListError(this.message);

  @override
  List<Object?> get props => [message];
}
