abstract interface class IAuthResponse {
  IAuthResponse({
    required this.token,
    required this.userId,
  });

  final int userId;
  final String token;
}
