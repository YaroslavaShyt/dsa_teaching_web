import 'package:dio/dio.dart';
import 'package:dsa_teaching_web/data/networking/endpoints.dart';
import 'package:dsa_teaching_web/domain/storage/ilocal_storage.dart';

const String _token = 'token';
const String _id = 'id';

const String _authorization = 'Authorization';
const String _bearer = 'Bearer';
const String _xUserId = 'X-User-Id';

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
      final data = await Future.wait(
        [
          _storage.read(key: _token),
          _storage.read(key: _id),
        ],
      );

      options.headers[_authorization] = '$_bearer ${data.first}';
      options.headers[_xUserId] =
          data.last != null ? int.parse(data.last!) : data.last;
    }
    handler.next(options);
  }

  bool _isAuthHeaderRequired(RequestOptions options) {
    return options.path != Endpoints.signInEndpoint &&
        options.path != Endpoints.signUpEndpoint;
  }
}
