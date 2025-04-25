import 'package:dio/dio.dart';
import 'package:dsa_teaching_web/domain/auth/iauth_repository.dart';

import '../../domain/auth/iauth_response.dart';
import '../../domain/auth/isign_in_model.dart';
import '../../domain/networking/inetworking_client.dart';
import '../networking/endpoints.dart';
import 'auth_response.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository({
    required INetworkingClient networkingClient,
  }) : _networkingClient = networkingClient;

  final INetworkingClient _networkingClient;

  @override
  Future<IAuthResponse?> signIn(ISignInModel model) async {
    try {
      final Response? response = await _networkingClient.post(
        Endpoints.signInEndpoint,
        body: model.toJson(),
      );
      if (response == null) return null;

      if (response.statusCode == 200) {
        return AuthResponse.fromJson(response.data);
      }
    } catch (_) {
      rethrow;
    }
    return null;
  }
}
