import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:pedidos_express/services/api_services.dart';
import '../../services/models/ecommerce_model.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final _logger = Logger();
  String? errorMessage;
  EcommerceModel? ecommerce;
  ApiService _apiService = ApiService();

  HomeScreenBloc() : super(HomeScreenInitialState()) {
    on<HomeScreenEvent>((event, emit) {
      switch(event.runtimeType){
        case HomeScreenInitialEvent:
          _logger.i(HomeScreenInitialEvent);
          emit(HomeScreenInitialState(ecommerce: ecommerce));
        break;
        case HomeScreenErrorEvent:
          _logger.i(HomeScreenErrorEvent);
          emit(HomeScreenErrorState(errorMessage: errorMessage));
        break;
        case HomeScreenSuccessEvent:
          _logger.i(HomeScreenSuccessEvent);
          emit(HomeScreenSuccessState(ecommerce: ecommerce));
        break;
        case HomeScreenLoadingEvent:
          _logger.i(HomeScreenLoadingEvent);
          emit(HomeScreenLoadingState(ecommerce: ecommerce));
        break;
    }});

  }

  Future<void> getEcommerce() async {
    add(HomeScreenLoadingEvent());
    final result = await _apiService.getFullEcommerce();
    if(result.success){
      ecommerce = result.data;
      add(HomeScreenSuccessEvent());
      return;
    }else{
      errorMessage = result.errorMessage;
      add(HomeScreenErrorEvent());
      return;
    }

  }

}
