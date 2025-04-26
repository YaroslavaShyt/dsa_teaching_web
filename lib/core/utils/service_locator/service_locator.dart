import 'package:dsa_teaching_web/core/utils/navigation/inavigation_util.dart';
import 'package:dsa_teaching_web/core/utils/navigation/navigation_util.dart';
import 'package:dsa_teaching_web/data/auth/auth_repository.dart';
import 'package:dsa_teaching_web/data/networking/networking_client.dart';
import 'package:dsa_teaching_web/data/services/auth/token/token_service.dart';
import 'package:dsa_teaching_web/data/services/lesson/lesson_service.dart';
import 'package:dsa_teaching_web/data/user/user_repository.dart';
import 'package:dsa_teaching_web/domain/lesson/ilesson_repository.dart';
import 'package:dsa_teaching_web/domain/networking/inetworking_client.dart';
import 'package:dsa_teaching_web/domain/services/lesson/ilesson_service.dart';
import 'package:dsa_teaching_web/domain/storage/ilocal_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/lesson/lesson_repository.dart';
import '../../../data/services/auth/auth_service.dart';
import '../../../data/services/user/user_service.dart';
import '../../../data/storage/local_storage.dart';
import '../../../domain/auth/iauth_repository.dart';
import '../../../domain/services/auth/itoken_service.dart';
import '../../../domain/user/iuser_repository.dart';

final GetIt sl = GetIt.instance;

class ServiceLocator {
  static Future<void> init() async {
    _initNavigation();
    await _initLocalStorage();
    _initNetworking();
    _initRepos();
    _initServices();
  }

  static void _initNavigation() {
    sl.registerSingleton<INavigationUtil>(NavigationUtil());
  }

  static void _initNetworking() {
    sl.registerFactory<INetworkingClient>(() => NetworkingClient(
          localStorage: sl<ILocalStorage>(),
        ));
  }

  static void _initRepos() {
    final INetworkingClient networkingClient = sl.get<INetworkingClient>();
    sl.registerFactory<IAuthRepository>(
      () => AuthRepository(networkingClient: networkingClient),
    );
    sl.registerFactory<IUserRepository>(
      () => UserRepository(networkingClient: networkingClient),
    );
    sl.registerFactory<ILessonRepository>(
      () => LessonRepository(networkingClient: networkingClient),
    );
  }

  static void _initServices() {
    sl.registerFactory<ITokenService>(
      () => TokenService(storage: sl.get<ILocalStorage>()),
    );
    sl.registerSingleton<ILessonService>(
      LessonService(
        lessonRepository: sl<ILessonRepository>(),
      ),
    );
  }

  static Future<void> _initLocalStorage() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sl.registerFactory<ILocalStorage>(
      () => LocalStorage(sharedPreferences: sharedPref),
    );
  }

  static List<BlocProvider> get cubitAsService => [
        BlocProvider<AuthService>(
          create: (_) => AuthService(
            tokenService: sl.get<ITokenService>(),
            repository: sl.get<IAuthRepository>(),
          )..checkAuth(),
        ),
        BlocProvider<UserService>(
          create: (BuildContext context) => UserService(
            userRepository: sl.get<IUserRepository>(),
            authService: BlocProvider.of<AuthService>(context),
          )..onAuthStateChanged(),
        ),
      ];
}
