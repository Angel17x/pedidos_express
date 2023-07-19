part of 'login_screen_bloc.dart';

class LoginScreenEvent {
  const LoginScreenEvent();
}

class LoginScreenInitialEvent extends LoginScreenEvent {
  LoginScreenInitialEvent();
}

class LoginScreenLoadingEvent extends LoginScreenEvent {
  LoginScreenLoadingEvent();
}

class LoginScreenErrorEvent extends LoginScreenEvent {
  LoginScreenErrorEvent();
}
class LoginScreenSuccessEvent extends LoginScreenEvent {
  LoginScreenSuccessEvent();
}
