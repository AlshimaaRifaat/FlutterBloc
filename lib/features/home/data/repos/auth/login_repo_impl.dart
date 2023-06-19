
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc_sample/app_constants.dart';
import 'package:flutter_bloc_sample/core/api/api_service.dart';
import 'package:flutter_bloc_sample/core/errors/failures.dart';
import 'package:flutter_bloc_sample/features/home/data/repos/auth/login_repo.dart';
import 'package:flutter_bloc_sample/features/home/models/login_response.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiService apiService;

  LoginRepoImpl(this.apiService);
  @override
  Future<Either<Failure, LoginResponse>> login(String email, String password) async {
    try {
      var data = await apiService.login(
          endPoint:
              AppConstants.signIn,email: email,password: password);

     LoginResponse loginResponse = LoginResponse.fromJson(data);
      return right(loginResponse);
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


