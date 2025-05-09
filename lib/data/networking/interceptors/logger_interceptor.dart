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
    String logMessage = '${options.method} request => $requestPath\n';

    final data = options.data;

    if (data is FormData) {
      logMessage += 'FormData Fields:\n';
      for (final field in data.fields) {
        logMessage += '  ${field.key}: ${field.value}\n';
      }

      logMessage += 'FormData Files:\n';
      for (final file in data.files) {
        logMessage +=
            '  ${file.key}: filename=${file.value.filename}, contentType=${file.value.contentType}\n';
      }
    } else {
      logMessage += 'DATA: $data';
    }

    logger.i(logMessage);

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
