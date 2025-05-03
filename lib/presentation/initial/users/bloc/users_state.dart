import 'package:dsa_teaching_web/domain/user/iuser.dart';
import 'package:dsa_teaching_web/domain/user/iuser_learned_lessons.dart';
import 'package:equatable/equatable.dart';

enum UserStatus { loading, success, failure }

enum ScreenStatus { initial, seeUserInfo }

class UsersState extends Equatable {
  const UsersState({
    this.status = UserStatus.loading,
    this.screenStatus = ScreenStatus.initial,
    this.users = const [],
    this.userLearnedLessons = const [],
    this.selectedUserId,
  });

  UsersState copyWith({
    UserStatus? status,
    List<IUser>? users,
    ScreenStatus? screenStatus,
    List<IUserLearnedLessons>? userLearnedLessons,
    int? selectedUserId,
  }) {
    return UsersState(
      status: status ?? this.status,
      users: users ?? this.users,
      screenStatus: screenStatus ?? this.screenStatus,
      userLearnedLessons: screenStatus == ScreenStatus.seeUserInfo
          ? userLearnedLessons ?? this.userLearnedLessons
          : [],
      selectedUserId: screenStatus == ScreenStatus.initial
          ? null
          : selectedUserId ?? this.selectedUserId,
    );
  }

  final UserStatus status;
  final ScreenStatus screenStatus;
  final List<IUser> users;
  final List<IUserLearnedLessons> userLearnedLessons;
  final int? selectedUserId;

  @override
  List<Object?> get props => [
        status,
        users,
        screenStatus,
        userLearnedLessons,
        selectedUserId,
      ];
}
