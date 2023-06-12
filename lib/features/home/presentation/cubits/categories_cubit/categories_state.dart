part of 'categories_cubit.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesFailure extends CategoriesState {
  final String errorMessage;

  const CategoriesFailure(this.errorMessage);
}

class CategoriesSuccess extends CategoriesState {
  final List<CategoriesModelDataData> categories;

  const CategoriesSuccess(this.categories);
}
