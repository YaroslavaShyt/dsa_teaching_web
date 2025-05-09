import 'package:dio/dio.dart';
import 'package:dsa_teaching_web/data/networking/endpoints.dart';
import 'package:dsa_teaching_web/domain/networking/inetworking_client.dart';
import 'package:dsa_teaching_web/domain/storage/ilocal_storage.dart';

import 'interceptors/auth_interceptor.dart';
import 'interceptors/logger_interceptor.dart';

class NetworkingClient implements INetworkingClient {
  NetworkingClient({
    required ILocalStorage localStorage,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseEndpoint,
        headers: {
          'Content-Type': 'application/json',
        },
        responseType: ResponseType.json,
      ),
    )
      ..interceptors.addAll([
        LoggerInterceptor(),
        AuthInterceptor(storage: localStorage),
      ])
      ..transformer = BackgroundTransformer();
  }

  late final Dio _dio;

  @override
  Future<Response?> delete(String endpoint) async {
    try {
      return _dio.delete(endpoint);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response?> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic> body = const <String, dynamic>{},
  }) async {
    try {
      return _dio.get(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response?> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    try {
      return _dio.post(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response?> put(
    String endpoint, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return _dio.put(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );
    } catch (e) {
      rethrow;
    }
  }
}
