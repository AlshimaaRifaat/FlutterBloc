
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc_sample/app_constants.dart';
import 'package:flutter_bloc_sample/core/api/api_service.dart';
import 'package:flutter_bloc_sample/core/errors/failures.dart';
import 'package:flutter_bloc_sample/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc_sample/features/home/models/categories_model.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<CategoriesModelDataData>>> fetchCategoriesList() async {
    try {
      var data = await apiService.getCategoriesList(
          endPoint:
              AppConstants.categories);
      List<CategoriesModelDataData> categories = [];
      for (var item in data['data']['data']) {
        try {
          categories.add(CategoriesModelDataData.fromJson(item));
        } catch (e) {
          categories.add(CategoriesModelDataData.fromJson(item));
        }
      }

      return right(categories);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }


}


