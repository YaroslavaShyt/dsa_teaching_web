import 'package:dsa_teaching_web/core/utils/logger/logger.dart';
import 'package:dsa_teaching_web/core/utils/navigation/inavigation_util.dart';
import 'package:dsa_teaching_web/core/utils/navigation/routes.dart';
import 'package:dsa_teaching_web/domain/services/user/iuser_service.dart';
import 'package:dsa_teaching_web/domain/user/iuser.dart';
import 'package:dsa_teaching_web/domain/user/iuser_learned_lessons.dart';
import 'package:dsa_teaching_web/presentation/initial/users/bloc/users_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit({
    required IUserService userService,
    required INavigationUtil navigationUtil,
  })  : _userService = userService,
        _navigationUtil = navigationUtil,
        super(UsersState());

  final IUserService _userService;
  final INavigationUtil _navigationUtil;

  Future<void> init() async {
    try {
      final List<IUser> users = await _userService.getAllUsers();

      emit(state.copyWith(users: users, status: UserStatus.success));
    } catch (error) {
      logger.e(error);
      emit(state.copyWith(status: UserStatus.failure));
    }
  }

  void onBackPressed() {
    _navigationUtil.navigateToAndReplace(AppRoutes.routeInitial);
  }

  void onClosePressed() {
    emit(state.copyWith(screenStatus: ScreenStatus.initial));
  }

  Future<void> onUserSelected(int id) async {
    try {
      emit(
        state.copyWith(selectedUserId: id),
      );

      final List<IUserLearnedLessons> lessons =
          await _userService.getAllUserLessons(id);

      emit(
        state.copyWith(
          screenStatus: ScreenStatus.seeUserInfo,
          userLearnedLessons: lessons,
        ),
      );
    } catch (error) {
      logger.e(error);
      emit(state.copyWith(status: UserStatus.failure));
    }
  }
}
