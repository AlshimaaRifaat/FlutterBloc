import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_sample/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc_sample/features/home/models/categories_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());

  final HomeRepo homeRepo;

  Future<void> fetchCategoriesList() async {
    emit(CategoriesLoading());
    var result = await homeRepo.fetchCategoriesList();
    result.fold((failure) {
      emit(CategoriesFailure(failure.errMessage));
    }, (categories) {
      emit(CategoriesSuccess(categories));
    });
  }
}
