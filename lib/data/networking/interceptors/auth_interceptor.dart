import 'package:dio/dio.dart';
import 'package:dsa_teaching_web/data/networking/endpoints.dart';
import 'package:dsa_teaching_web/domain/storage/ilocal_storage.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required ILocalStorage storage,
  }) : _storage = storage;

  final ILocalStorage _storage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_isAuthHeaderRequired(options)) {
      final data = await Future.wait([
        _storage.read(key: 'token'),
        _storage.read(key: 'id'),
      ]);
      options.headers['Authorization'] = 'Bearer ${data.first}';
      options.headers['X-User-Id'] =
          data.last != null ? int.parse(data.last!) : data.last;
    }
    handler.next(options);
  }

  bool _isAuthHeaderRequired(RequestOptions options) {
    return options.path != Endpoints.signInEndpoint &&
        options.path != Endpoints.signUpEndpoint;
  }
}
