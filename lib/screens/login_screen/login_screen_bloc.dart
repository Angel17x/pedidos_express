import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:pedidos_express/services/api_services.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pedidos_express/services/cache_services.dart';
import 'package:pedidos_express/utils/utils.dart';
part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc() : super(LoginScreenInitialState()) {
    on<LoginScreenEvent>((event, emit) {
      switch(event.runtimeType){
        case LoginScreenInitialEvent:
          _logger.i(LoginScreenInitialEvent);
          emit(LoginScreenInitialState());
        break;
        case LoginScreenErrorEvent:
          _logger.i(LoginScreenErrorEvent);
          emit(LoginScreenErrorState(errorMessage: errorMessage));
        break;
        case LoginScreenSuccessEvent:
          _logger.i(LoginScreenSuccessEvent);
          emit(LoginScreenSuccessState());
        break;
        case LoginScreenLoadingEvent:
          _logger.i(LoginScreenLoadingEvent);
          emit(LoginScreenLoadingState());
        break;
      }
    });
  }

  final _logger = Logger();
  final userNameController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _apiService = ApiService();
  final REX_EMAIL = MyUtils.REX_EMAIL;
  String? errorMessage;

  String? validateUserName(String? value) {
    if (value == null || value == "") {
      return "El correo electrónico no puede estar vacío";
    }

    if (!REX_EMAIL.hasMatch(value)) {
      return "Ingrese un correo electrónico válido";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value == "") {
      return "La contraseña no puede estar vacía";
    }
    if(value.trim() == ""){
      return "La contraseña no puede tener espacios en blanco";
    }
    if (value.length <= 4){
      return "La contraseña no puede ser menor a 4 digitos";
    }

    return null;
  }

  Future<void> loginService() async {
    bool isFormValid = formKey.currentState?.validate() ?? false;
    if(!isFormValid){
      return;
    }
    final email = userNameController.text;
    final password = passwordController.text;

    add(LoginScreenLoadingEvent());
    final result = await _apiService.login(email: email, password: password);

    if(result.success){
      final isLogin = result.data ?? false;
      if(!isLogin){
        errorMessage = result.errorMessage ?? "Error al iniciar sesión";
        add(LoginScreenErrorEvent());
      }
      add(LoginScreenSuccessEvent());
    }else{
      errorMessage = result.errorMessage ?? "Error al iniciar sesión";
      add(LoginScreenErrorEvent());
    }
  }
}
