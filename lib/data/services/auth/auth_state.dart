import 'package:equatable/equatable.dart';

enum AuthStatus { loading, authorized, notAuthorized }

class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.loading,
  });

  AuthState copyWith({
    AuthStatus? status,
  }) {
    return AuthState(
      status: status ?? this.status,
    );
  }

  final AuthStatus status;

  @override
  List<Object?> get props => [
        status,
      ];
}
