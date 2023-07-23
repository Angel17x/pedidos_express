part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenState {
  EcommerceModel? ecommerce;
  HomeScreenState({this.ecommerce});
}

class HomeScreenInitialState extends HomeScreenState {
  EcommerceModel? ecommerce;
  HomeScreenInitialState({this.ecommerce});
}

class HomeScreenLoadingState extends HomeScreenState {
  EcommerceModel? ecommerce;
  HomeScreenLoadingState({this.ecommerce});
}

class HomeScreenErrorState extends HomeScreenState {
  String? errorMessage;
  HomeScreenErrorState({ this.errorMessage });
}
class HomeScreenSuccessState extends HomeScreenState {
  EcommerceModel? ecommerce;
  HomeScreenSuccessState({this.ecommerce});
}