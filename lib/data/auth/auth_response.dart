import '../../domain/auth/iauth_response.dart';

class AuthResponse implements IAuthResponse {
  AuthResponse({
    required this.token,
    required this.userId,
  });

  factory AuthResponse.fromJson(Map<dynamic, dynamic> json) {
    return AuthResponse(
      token: json['token'],
      userId: json['userId'],
    );
  }

  @override
  final int userId;
  @override
  final String token;
}
