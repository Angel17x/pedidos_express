part of 'login_screen_bloc.dart';

class LoginScreenState {
  const LoginScreenState();
}

class LoginScreenInitialState extends LoginScreenState {
  LoginScreenInitialState();
}

class LoginScreenLoadingState extends LoginScreenState {
  LoginScreenLoadingState();
}

class LoginScreenErrorState extends LoginScreenState {
  final String? errorMessage;
  LoginScreenErrorState({String? this.errorMessage});
}
class LoginScreenSuccessState extends LoginScreenState {
  LoginScreenSuccessState();
}