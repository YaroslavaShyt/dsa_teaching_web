abstract interface class IUser {
  IUser({
    required this.id,
    required this.firstName,
    required this.email,
    required this.createdAt,
  });

  IUser copyWith({
    String? id,
    String? firstName,
    String? email,
    String? createdAt,
  });

  Map<String, String> toJson(IUser user);

  final String id;
  final String firstName;
  final String email;
  final String createdAt;
}
