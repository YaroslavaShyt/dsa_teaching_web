import 'package:equatable/equatable.dart';

import '../../../domain/user/iuser.dart';

enum UserStatus {
  initialized,
  notInitialized,
  undefined,
}

class UserState extends Equatable {
  const UserState({
    this.status = UserStatus.undefined,
    this.user,
  });

  UserState copyWith({
    UserStatus? status,
    IUser? user,
  }) {
    final bool shouldClearUser =
        status == UserStatus.notInitialized || status == UserStatus.undefined;

    return UserState(
      user: shouldClearUser ? null : user,
      status: status ?? this.status,
    );
  }

  final IUser? user;
  final UserStatus status;

  @override
  List<Object?> get props => [
        user,
        status,
      ];
}
