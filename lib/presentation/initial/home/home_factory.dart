import 'package:dsa_teaching_web/core/utils/navigation/inavigation_util.dart';
import 'package:dsa_teaching_web/core/utils/service_locator/service_locator.dart';
import 'package:dsa_teaching_web/data/services/auth/auth_service.dart';
import 'package:dsa_teaching_web/data/services/user/user_service.dart';
import 'package:dsa_teaching_web/domain/services/lesson/ilesson_service.dart';
import 'package:dsa_teaching_web/domain/teaching/iteaching_repository.dart';
import 'package:dsa_teaching_web/presentation/initial/home/bloc/home_cubit.dart';
import 'package:dsa_teaching_web/presentation/initial/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFactory {
  static Widget build() {
    return BlocProvider(
      create: (context) => HomeCubit(
        navigationUtil: sl.get<INavigationUtil>(),
        lessonService: sl.get<ILessonService>(),
        teachingRepository: sl.get<ITeachingRepository>(),
        userService: BlocProvider.of<UserService>(context),
        authService: BlocProvider.of<AuthService>(context),
      )..init(),
      child: Builder(
        builder: (context) {
          return HomeScreen(
            cubit: BlocProvider.of<HomeCubit>(context),
          );
        },
      ),
    );
  }
}
