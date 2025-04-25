import 'dart:async';

import 'package:dsa_teaching_web/data/services/user/user_state.dart';
import 'package:dsa_teaching_web/domain/services/auth/iauth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/logger/logger.dart';
import '../../../domain/services/user/iuser_service.dart';
import '../../../domain/user/iuser.dart';
import '../../../domain/user/iuser_repository.dart';
import '../auth/auth_state.dart';

class UserService extends Cubit<UserState> implements IUserService {
  UserService({
    required IAuthService authService,
    required IUserRepository userRepository,
  })  : _authService = authService,
        _userRepository = userRepository,
        super(const UserState());

  @override
  IUser? get user => state.user;

  final IAuthService _authService;
  final IUserRepository _userRepository;

  StreamSubscription<AuthState>? _authStream;

  void onAuthStateChanged() {
    _authStream = _authService.stream.listen(
      (AuthState authState) {
        return switch (authState.status) {
          AuthStatus.loading =>
            emit(state.copyWith(status: UserStatus.notInitialized)),
          AuthStatus.authorized => init(),
          AuthStatus.notAuthorized =>
            emit(state.copyWith(status: UserStatus.notInitialized)),
        };
      },
    );
  }

  @override
  Future<void> init() async {
    try {
      final IUser? user = await _userRepository.getUser();
      final UserStatus status =
          user == null ? UserStatus.notInitialized : UserStatus.initialized;

      emit(state.copyWith(status: status, user: user));
    } catch (error) {
      logger.e(error);
    }
  }

  @override
  Future<void> updateUser({
    String? name,
  }) async {
    try {
      emit(state.copyWith(user: user?.copyWith(firstName: name)));
      await _userRepository.updateUser(
        state.user!.toJson(state.user!),
      );
    } catch (error) {
      logger.e(error);
    }
  }

  @override
  Future<void> cleanUserData() async {
    await _authService.signOut();
  }

  @override
  Future<void> deleteUser() async {
    try {
      final bool isDeleted = await _userRepository.deleteUser();

      if (!isDeleted) {
        debugPrint("not deleted");
        return;
      }

      await cleanUserData();
    } catch (error) {
      logger.e(error);
    }
  }

  @override
  Future<void> close() {
    _authStream?.cancel();
    return super.close();
  }
}
