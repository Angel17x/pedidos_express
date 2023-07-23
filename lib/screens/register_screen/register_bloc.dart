import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:pedidos_express/services/api_services.dart';
import 'package:pedidos_express/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final _logger = Logger();
  String? errorMessage;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ApiService _apiServices = ApiService();

  final REX_EMAIL = MyUtils.REX_EMAIL;
  final REX_NAME = MyUtils.REX_NAME_LASTNAME;
  final REX_PASSWORD = MyUtils.REX_PASSWORD;
  final name = TextEditingController(text: "");
  final address = TextEditingController(text: "");
  final email = TextEditingController(text: "");
  final password = TextEditingController(text: "");


  RegisterBloc() : super(RegisterScreenInitialState()) {
    on<RegisterEvent>((event, emit) {
      switch(event.runtimeType){
        case RegisterScreenInitialEvent:
          emit(RegisterScreenInitialState());
        break;
        case RegisterScreenLoadingEvent:
          emit(RegisterScreenLoadingState());
        break;
        case RegisterScreenSuccessEvent:
          emit(RegisterScreenSuccessState());
        break;
        case RegisterScreenErrorEvent:
          emit(RegisterScreenErrorState(errorMessage: errorMessage));
        break;
      }
    });
  }

  final _addressController = BehaviorSubject<String>();
  Stream<String> get addressStream => _addressController.stream;

  String? validateName(String? name){
    if (name == null || name == "") {
      return "El nombre no puede estar vacio";
    }
    if(!REX_NAME.hasMatch(name)){
      return "Ingresa un nombre y apellido válido";
    }
    return null;
  }

  String? validateAddress(String? address){
    if (address == null || address == "") {
      return "La dirección no puede estar vacia";
    }
    if(address.trim().length <= 4){
      return "La dirección debe ser mayor a 4 digitos";
    }
  }

  String? validateEmail(String? email) {
    if (email == null || email == "") {
      return "El correo electrónico no puede estar vacío";
    }
    if (!REX_EMAIL.hasMatch(email)) {
      return "Ingrese un correo electrónico válido";
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password == "") {
      return "La contraseña no puede estar vacía";
    }
    if(!REX_PASSWORD.hasMatch(password)){
      return "La contraseña no puede tener espacios en blanco";
    }
    return null;
  }

  Future<void> register() async {
    bool isFormValid = formKey.currentState?.validate() ?? false;
    if(!isFormValid){
      return;
    }
    add(RegisterScreenLoadingEvent());

    final _name = name.text;
    final _address = address.text;
    final _email = email.text;
    final _password = password.text;
    final result = await _apiServices.registerUser(
        name: _name,
        address: _address,
        email: _email,
        password: _password);
    if(result.success){
      bool isRegister = result.data ?? false;
      if(isRegister){
        add(RegisterScreenSuccessEvent());
      }else{
        errorMessage = result.errorMessage ?? "Error al registrar el usuario";
        add(RegisterScreenErrorEvent());
      }
      return;
    }else{
      errorMessage = result.errorMessage ?? "Error al registrar el usuario";
      add(RegisterScreenErrorEvent());
    }
  }

  @override
  Future<void> close() async {
    name.dispose();
    address.dispose();
    email.dispose();
    password.dispose();
    super.close();
  }

}
