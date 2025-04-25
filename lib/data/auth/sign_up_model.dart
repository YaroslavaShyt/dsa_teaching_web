import '../../domain/auth/isign_up_model.dart';

const String _firstName = 'firstName';
const String _lastName = 'lastName';
const String _username = 'username';
const String _password = 'password';

class SignUpModel implements ISignUpModel {
  SignUpModel({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  final String name;

  @override
  final String email;

  @override
  final String password;

  @override
  Map<String, String> toJson() {
    return {
      _firstName: name,
      _lastName: name,
      _username: email,
      _password: password,
    };
  }
}
