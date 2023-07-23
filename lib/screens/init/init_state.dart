part of 'init_bloc.dart';

@immutable
abstract class InitState {}

class InitScreenInitialState extends InitState {
  InitScreenInitialState();
}
class InitScreenLoadingState extends InitState {
  InitScreenLoadingState();
}
class InitScreenLoadedState extends InitState {
  InitScreenLoadedState();
}
class InitScreenErrorState extends InitState {
  InitScreenErrorState();
}
