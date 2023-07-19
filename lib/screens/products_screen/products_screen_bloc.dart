import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_screen_event.dart';
part 'products_screen_state.dart';

class ProductsScreenBloc extends Bloc<ProductsScreenEvent, ProductsScreenState> {
  ProductsScreenBloc() : super(ProductsScreenInitial()) {
    on<ProductsScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
