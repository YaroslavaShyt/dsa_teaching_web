import 'package:equatable/equatable.dart';

enum LoginStatus { loading, failure, initial }

class AuthState extends Equatable {
  const AuthState({
    this.status = LoginStatus.initial,
    this.login = '',
    this.password = '',
    this.isButtonActive = false,
  });

  AuthState copyWith({
    LoginStatus? status,
    String? login,
    String? password,
    bool? isButtonActive,
    bool? isButtonLoading,
  }) {
    return AuthState(
      status: status ?? this.status,
      login: login ?? this.login,
      password: password ?? this.password,
      isButtonActive: isButtonActive ?? this.isButtonActive,
    );
  }

  final LoginStatus status;
  final String login;
  final String password;
  final bool isButtonActive;

  @override
  List<Object?> get props => [
        status,
        login,
        password,
        isButtonActive,
      ];
}
