
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_sample/core/errors/failures.dart';
import 'package:flutter_bloc_sample/features/home/models/categories_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoriesModelDataData>>> fetchCategoriesList();
}
