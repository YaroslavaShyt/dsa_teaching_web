import 'package:dio/dio.dart';

abstract class INetworkingClient {
  Future<Response?> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, String> body,
  });

  Future<Response?> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
  });

  Future<Response?> put(
    String endpoint, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
  });

  Future<Response?> delete(String endpoint);
}
