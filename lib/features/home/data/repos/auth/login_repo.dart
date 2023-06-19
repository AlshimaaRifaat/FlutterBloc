
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_sample/core/errors/failures.dart';
import 'package:flutter_bloc_sample/features/home/models/categories_model.dart';
import 'package:flutter_bloc_sample/features/home/models/login_response.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginResponse>> login(String email, String password);
}
