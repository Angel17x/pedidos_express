part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterScreenInitialState extends RegisterState {
  RegisterScreenInitialState();
}
class RegisterScreenLoadingState extends RegisterState {
  RegisterScreenLoadingState();
}
class RegisterScreenSuccessState extends RegisterState {
  RegisterScreenSuccessState();
}
class RegisterScreenErrorState extends RegisterState {
  String? errorMessage;
  RegisterScreenErrorState({ this.errorMessage });
}