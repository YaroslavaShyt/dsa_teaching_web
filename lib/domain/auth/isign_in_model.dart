abstract interface class ISignInModel {
  ISignInModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  Map<String, String> toJson();
}
