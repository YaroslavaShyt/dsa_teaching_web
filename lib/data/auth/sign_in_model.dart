import '../../domain/auth/isign_in_model.dart';

const String _username = 'username';
const String _password = 'password';

class SignInModel implements ISignInModel {
  SignInModel({
    required this.email,
    required this.password,
  });

  @override
  final String email;

  @override
  final String password;

  @override
  Map<String, String> toJson() {
    return {
      _username: email,
      _password: password,
    };
  }
}
