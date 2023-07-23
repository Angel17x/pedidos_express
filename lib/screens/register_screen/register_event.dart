part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterScreenInitialEvent extends RegisterEvent {
  RegisterScreenInitialEvent();
}
class RegisterScreenLoadingEvent extends RegisterEvent {
  RegisterScreenLoadingEvent();
}
class RegisterScreenSuccessEvent extends RegisterEvent {
  RegisterScreenSuccessEvent();
}
class RegisterScreenErrorEvent extends RegisterEvent {
  RegisterScreenErrorEvent();
}


