part of 'login_cubit.dart';

@immutable
class LoginState {
 const LoginState();

  @override
  List<Object> get props => [];
/*  final bool isLoading;
  final String errorMessage;
  final LoginResponse?  loginResponse;

  const LoginState({
    this.isLoading = false,
    this.errorMessage='',
    this.loginResponse ,
  });

  LoginState copyWith({
    bool? isLoading,
    String? errorMessage,
    LoginResponse?  loginResponse,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      loginResponse: loginResponse ?? this.loginResponse,
    );
  }*/
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String errorMessage;
  const LoginFailure(this.errorMessage);
}

class LoginSuccess extends LoginState {
  final LoginResponse loginResponse;
  const LoginSuccess(this.loginResponse);
}
