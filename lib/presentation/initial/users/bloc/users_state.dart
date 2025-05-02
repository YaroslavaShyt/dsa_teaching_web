import 'package:dsa_teaching_web/domain/user/iuser.dart';
import 'package:equatable/equatable.dart';

enum UserStatus { loading, success, failure }

class UsersState extends Equatable {
  const UsersState({
    this.status = UserStatus.loading,
    this.users = const [],
  });

  UsersState copyWith({
    UserStatus? status,
    List<IUser>? users,
  }) {
    return UsersState(
      status: status ?? this.status,
      users: users ?? this.users,
    );
  }

  final UserStatus status;
  final List<IUser> users;

  @override
  List<Object?> get props => [
        status,
        users,
      ];
}
