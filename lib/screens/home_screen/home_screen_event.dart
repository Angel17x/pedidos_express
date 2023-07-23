part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenEvent {
  HomeScreenEvent();
}

class HomeScreenInitialEvent extends HomeScreenEvent {
  HomeScreenInitialEvent();
}

class HomeScreenLoadingEvent extends HomeScreenEvent {
  HomeScreenLoadingEvent();
}

class HomeScreenErrorEvent extends HomeScreenEvent {
  HomeScreenErrorEvent();
}
class HomeScreenSuccessEvent extends HomeScreenEvent {
  HomeScreenSuccessEvent();
}
