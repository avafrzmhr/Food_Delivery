part of 'add_food_bloc.dart';

@immutable
abstract class AddFoodState extends Equatable {}

class AddFoodInitial extends AddFoodState {
  @override
  List<Object?> get props => [];
}

class AddFoodLoading extends AddFoodState {
  @override
  List<Object?> get props => [];
}

class AddFoodSuccess extends AddFoodState {
  AddFoodSuccess();

  @override
  List<Object?> get props => [];
}

class AddFoodError extends AddFoodState {
  final String message;

  AddFoodError(this.message);

  @override
  List<Object?> get props => [message];
}
