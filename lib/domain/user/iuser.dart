abstract interface class IUser {
  IUser({
    required this.id,
    required this.firstName,
  });

  IUser copyWith({
    String? id,
    String? firstName,
  });

  Map<String, String> toJson(IUser user);

  final String id;
  final String firstName;
}
