import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_sample/features/home/data/repos/auth/login_repo.dart';

import 'package:flutter_bloc_sample/features/home/models/login_response.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());

  final LoginRepo loginRepo;

  Future<void> login(String email, String password) async {

    emit(LoginLoading());

    var result = await loginRepo.login(email,password);
    result.fold((failure) {
     emit(LoginFailure(failure.errMessage));


    }, (loginMessage) {
      emit(LoginSuccess(loginMessage));


    });
    print('res '+result.toString());
  }
}
