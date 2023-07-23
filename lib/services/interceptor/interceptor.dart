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
        _logger.i('Request send to api: '
            '|| Request method ${data.method} \n '
            '|| request to ${data.url} '
            '|| headers ${data.headers} \n '
            '|| body: ${data.body} \n '
            '|| queryParameters: ${data.params}');

    } catch (e) {
      _logger.e('Request send to api error: '
          '|| Request method ${data.method} \n '
          '|| Request to ${data.url} '
          '|| Headers ${data.headers} \n '
          '|| Body: ${data.body} \n '
          '|| QueryParameters: ${data.params}'
          '|| Error ----- ${e}');
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if(data.statusCode != 200){
      _logger.e('Response api error: '
          '|| Status Code ${data.statusCode} \n'
          '|| Response method ${data.method} \n '
          '|| Response url to ${data.url} '
          '|| Headers ${data.headers} \n '
          '|| Response body: ${data.body} \n ');
    }else{
      _logger.i('Response api: '
          '|| Status Code ${data.statusCode} \n'
          '|| Response method ${data.method} \n '
          '|| Response url ${data.url} '
          '|| Headers ${data.headers} \n '
          '|| Response body: ${data.body} \n ');
    }
    return data;
  }
}

