import 'package:dsa_teaching_web/domain/auth/iauth_response.dart';

abstract interface class ITokenService {
  Future<String?> getToken();

  Future<bool> saveToken(IAuthResponse token);

  Future<void> clearToken();
}
