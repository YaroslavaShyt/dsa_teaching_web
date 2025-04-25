// import 'package:dio/dio.dart';
// import 'package:dsa_learning/core/exceptions/user_not_found_exception.dart';
// import 'package:dsa_learning/data/networking/endpoints.dart';
// import 'package:dsa_learning/domain/storage/isecure_storage.dart';
//
// class AuthInterceptor extends Interceptor {
//   AuthInterceptor({
//     required ISecureStorage storage,
//   }) : _storage = storage;
//
//   final ISecureStorage _storage;
//
//   @override
//   Future<void> onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     if (_isAuthHeaderRequired(options)) {
//       final data = await Future.wait([
//         _storage.read(key: 'token'),
//         _storage.read(key: 'id'),
//       ]);
//       options.headers['Authorization'] = 'Bearer ${data.first}';
//       options.headers['X-User-Id'] =
//           data.last != null ? int.parse(data.last!) : data.last;
//     }
//     handler.next(options);
//   }
//
//   bool _isAuthHeaderRequired(RequestOptions options) {
//     return options.path != Endpoints.signInEndpoint &&
//         options.path != Endpoints.signUpEndpoint;
//   }
//
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     if (err.response?.statusCode == 401) {
//       throw UserNotFoundException();
//     }
//     return super.onError(err, handler);
//   }
// }
