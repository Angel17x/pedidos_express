import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pedidos_express/services/cache_services.dart';

part 'init_event.dart';
part 'init_state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  final _cache = CacheServices();

  InitBloc() : super(InitScreenInitialState()) {
    on<InitEvent>((event, emit) {
    });
  }
}
