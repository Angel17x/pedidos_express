import 'package:ffcache/ffcache.dart';
import 'package:logger/logger.dart';
import 'models/credentials.dart';

class CacheServices {
  final _cache = new FFCache();
  final _logger = Logger();
  Future<bool> saveCredentials(Credentials credentials) async {
    try {
      _logger.i(credentials.toJson());
      await _cache.setJSON('credentials', credentials.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Credentials?> getCredentials() async {
    try {
      final credentials = await _cache.getJSON('credentials');
      return Credentials.fromJson(credentials);
    } catch (e) {
      return null;
    }
  }
  Future<bool> deleteCredentials() async {
    try {
      await _cache.remove('credentials');
      return true;
    } catch (e){
      return false;
    }
  }
}


