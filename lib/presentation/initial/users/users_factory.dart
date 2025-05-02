import 'package:dsa_teaching_web/core/utils/navigation/inavigation_util.dart';
import 'package:dsa_teaching_web/core/utils/service_locator/service_locator.dart';
import 'package:dsa_teaching_web/data/services/user/user_service.dart';
import 'package:dsa_teaching_web/presentation/initial/users/bloc/users_cubit.dart';
import 'package:dsa_teaching_web/presentation/initial/users/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersFactory {
  static Widget build() {
    return BlocProvider<UsersCubit>(
      create: (context) => UsersCubit(
        userService: BlocProvider.of<UserService>(context),
        navigationUtil: sl.get<INavigationUtil>(),
      )..init(),
      child: Builder(
        builder: (context) {
          return UsersScreen(
            cubit: BlocProvider.of<UsersCubit>(context),
          );
        },
      ),
    );
  }
}
