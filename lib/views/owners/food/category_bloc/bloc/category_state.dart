part of 'category_bloc.dart';

@immutable
abstract class CategoryState extends Equatable {}

class CategoryInitial extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryLoading extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategorySuccess extends CategoryState {
  final List<CategoryModel> categoryModel;
  CategorySuccess(this.categoryModel);

  @override
  List<Object?> get props => [categoryModel];
}

class CategoryError extends CategoryState {
  final String message;

  CategoryError(this.message);

  @override
  List<Object?> get props => [message];
}
