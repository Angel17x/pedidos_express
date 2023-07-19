import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'client_screen_event.dart';
part 'client_screen_state.dart';

class ClientScreenBloc extends Bloc<ClientScreenEvent, ClientScreenState> {
  ClientScreenBloc() : super(ClientScreenInitial()) {
    on<ClientScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
