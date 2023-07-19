import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:logger/logger.dart';
import 'package:pedidos_express/services/cache_services.dart';

class AuthInterceptorRequest implements InterceptorContract {
  final _logger = Logger();
  final _cache = CacheServices();
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
        final credentials = await _cache.getCredentials();
        if(credentials?.token!=null){
          data.headers["Authorization"] = "bearer ${credentials?.token}";
        }
    } catch (e) {
      _logger.e(e);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if(data.statusCode == 401){

    }
    return data;
  }

}