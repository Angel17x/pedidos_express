part of 'init_bloc.dart';

@immutable
abstract class InitEvent {}

class InitScreenInitialEvent extends InitEvent {
  InitScreenInitialEvent();
}
class InitScreenLoadingEvent extends InitEvent {
  InitScreenLoadingEvent();
}
class InitScreenLoadedEvent extends InitEvent {
  InitScreenLoadedEvent();
}
class InitScreenErrorEvent extends InitEvent {
  InitScreenErrorEvent();
}
