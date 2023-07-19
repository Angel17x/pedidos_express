import 'dart:convert';
import 'package:http_interceptor/http/http.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:pedidos_express/services/message.dart';
import 'package:pedidos_express/services/result.dart';
import 'package:pedidos_express/utils/translate.dart';
import 'package:pedidos_express/utils/utils.dart';
import 'interceptor/interceptor.dart';

class ClientHttp {
  final _logger = Logger();
  final _client = InterceptedClient.build(interceptors: [
    AuthInterceptorRequest()
  ]);
  final String _baseUrl = MyUtils.baseUrl;

  ClientHttp();

  Future<Result<T>> get<T>({required String path, Map<String, String>? queryParams}) async {
    final url = Uri.parse('$_baseUrl/$path');

    // Log antes de la petición
    _logger.d('GET request to $url with headers: ${_headers()} and query params: $queryParams');

    try {
      final response = await _client.get(url, headers: _headers(),);

      // Log después de la petición
      _logger.d('GET request to $url returned response with status code: ${response.statusCode} and body: ${response.body}');

      return _parseResponse<T>(response);
    } catch (e) {
      // Log en caso de error
      _logger.e('GET request to $url failed with error: $e');

      return Result<T>(
        success: false,
        errorMessage: 'Error: Failed to make GET request',
        data: null,
      );
    }
  }

  Future<Result<T>> post<T>(
      {required String path, Map<String, String>? queryParams, Map<String, dynamic>? body}) async {
    final url = Uri.parse('$_baseUrl/$path');
    final headers = _headers();
    final bodyJson = jsonEncode(body);

    // Log antes de la petición
    _logger.d('POST request to $url with headers: $headers and body: $bodyJson');

    try {
      final response = await _client.post(url, headers: headers, body: bodyJson);

      // Log después de la petición
      _logger.d('POST request to $url returned response with status code: ${response.statusCode} and body: ${response.body}');

      return _parseResponse<T>(response);
    } catch (e) {
      // Log en caso de error
      _logger.e('POST request to $url failed with error: $e');

      return Result<T>(
        success: false,
        errorMessage: translate(name: e.toString()),
        data: null,
      );
    }
  }

  Future<Result<T>> put<T>(
      {required String path, Map<String, String>? queryParams, Map<String, dynamic>? body}) async {
    final url = Uri.parse('$_baseUrl/$path');
    final headers = _headers();
    final bodyJson = jsonEncode(body);

    // Log antes de la petición
    _logger.d('PUT request to $url with headers: $headers and body: $bodyJson');

    try {
      final response = await _client.put(url, headers: headers, body: bodyJson);

      // Log después de la petición
      _logger.d('PUT request to $url returned response with status code: ${response.statusCode} and body: ${response.body}');

      return _parseResponse<T>(response);
    } catch (e) {
      // Log en caso de error
      _logger.e('PUT request to $url failed with error: $e');

      return Result<T>(
        success: false,
        errorMessage: 'Error: Failed to make PUT request',
        data: null,
      );
    }
  }

  Future<Result<T>> delete<T>({required String path, Map<String, String>? queryParams}) async {
    final url = Uri.parse('$_baseUrl/$path');

    // Log antes de la petición
    _logger.d('DELETE request to $url with headers: ${_headers()} and query params: $queryParams');

    try {
      final response = await _client.delete(url, headers: _headers(),);

      // Log después de la petición
      _logger.d('DELETE request to $url returned response with status code: ${response.statusCode} and body: ${response.body}');

      return _parseResponse<T>(response);
    } catch (e) {
      // Log en caso de error
      _logger.e('DELETE request to $url failed with error: $e');

      return Result<T>(
        success: false,
        errorMessage: 'Error: Failed to make DELETE request',
        data: null,
      );
    }
  }

  Map<String, String> _headers() {
    return {
      'Content-Type': 'application/json',
    };
  }

  Result<T> _parseResponse<T>(http.Response response) {
    try {
      if (response == null) {
        return Result<T>(
          success: false,
          errorMessage: translate(name: 'Error: No response received from server'),
          data: null,
        );
      }
      final responseJson = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return Result<T>(
          success: true,
          data: responseJson as T,
        );
      } else {
        Message? data = Message.fromJson(responseJson);
        _logger.i(data.error);
        return Result<T>(
          success: false,
          errorMessage: data.error,
          data: null,
        );
      }
    } catch (e) {
      return Result<T>(
        success: false,
        errorMessage: 'Error: Failed to parse response body',
        data: null,
      );
    }
  }
}