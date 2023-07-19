import 'package:pedidos_express/services/cache_services.dart';
import 'package:pedidos_express/services/domain/credentials.dart';
import 'package:pedidos_express/services/http.dart';
import 'package:pedidos_express/services/result.dart';

class ApiService {
  final _client = ClientHttp();
  final _cache = CacheServices();

  Future<Result<bool>> login({required String email, required String password}) async {
    try {
      await Future.delayed(Duration(seconds: 4));
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

}