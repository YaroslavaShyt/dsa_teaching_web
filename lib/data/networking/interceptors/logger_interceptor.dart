import 'package:dio/dio.dart';
import 'package:dsa_teaching_web/core/utils/logger/logger.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final RequestOptions options = err.requestOptions;
    final String requestPath = '${options.baseUrl}${options.path}';

    logger.d(
      '${options.method} request => $requestPath\n'
      'Error type: ${err.error} \n'
      'Error message: ${err.message}',
    );

    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String requestPath = '${options.baseUrl}${options.path}';

    logger.i(
      '${options.method} request => $requestPath\n'
      'DATA: ${options.data}',
    );

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d(
      '${response.requestOptions.method} request => ${response.realUri}\n'
      'STATUS CODE: ${response.statusCode} \n '
      'STATUS MESSAGE: ${response.statusMessage} \n'
      'HEADERS: ${response.headers} \n'
      'DATA: ${response.data}',
    );

    handler.next(response);
  }
}
