import 'dart:ffi';
import 'dart:math';

import 'package:logger/logger.dart';
import 'package:pedidos_express/services/cache_services.dart';
import 'package:pedidos_express/services/models/credentials.dart';
import 'package:pedidos_express/services/http.dart';
import 'package:pedidos_express/services/models/ecommerce_model.dart';
import 'package:pedidos_express/services/result.dart';

class ApiService {
  final _client = ClientHttp();
  final _cache = CacheServices();

  Future<Result<bool>> login({required String email, required String password}) async {
    try {
      // await Future.delayed(Duration(seconds: 4));
      final response = await _client.post(path: '/login', body: {"email": email, "password": password});
      if(response.success){
        final credentials = Credentials.fromJson(response.data);
        if(credentials.token == null || credentials.token == ""){
          throw "No hay credenciales disponibles";
        }
        final isSaveAccessToken = await _cache.saveCredentials(credentials);
        return Result.success(response.statusCode, isSaveAccessToken);
      }

      throw response.errorMessage ?? "Error al iniciar sesion";
    } catch (error, stacktrace) {
      return Result.failMsg(error.toString());
    }
  }

  Future<Result<EcommerceModel?>> getFullEcommerce() async {
    try {
      // await Future.delayed(Duration(seconds: 4));
      final response = await _client.post(path: '/ecommerce-full-data', body: {});
      if(response.success){
        Logger().i(EcommerceModel.fromJson(response.data["data"]).toString());
        return Result.success(response.statusCode, EcommerceModel.fromJson(response.data["data"]));
      }
      throw response.errorMessage ?? "Error al obtener el comercio/cliente";
    } catch (error, stacktrace) {
      return Result.failMsg(error.toString());
    }
  }

  Future<Result<bool>> registerUser({
    required String name,
    required String address,
    required String email,
    required String password
  }) async {
    try {
      // await Future.delayed(Duration(seconds: 4));
      final response = await _client.post(
          path: 'register',
          body: {"name": name, "address": address,"email": email, "password": password});
      if(response.success){
        return Result.success(response.statusCode, true);
      }
      throw response.errorMessage ?? "Error al registrar el usuario";
    } catch (error, stacktrace) {
      return Result.failMsg(error.toString());
    }
  }

}