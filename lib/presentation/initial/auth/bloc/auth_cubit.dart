import 'package:dsa_teaching_web/core/utils/logger/logger.dart';
import 'package:dsa_teaching_web/data/auth/sign_in_model.dart';
import 'package:dsa_teaching_web/domain/services/auth/iauth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required IAuthService authService,
  })  : _authService = authService,
        super(AuthState());

  final IAuthService _authService;

  void onLoginEntered(String login) {
    final bool isButtonActive = login.length > 6 && state.password.length >= 6;
    emit(state.copyWith(login: login, isButtonActive: isButtonActive));
  }

  void onPasswordEntered(String password) {
    final bool isButtonActive = state.login.length > 6 && password.length >= 6;
    emit(state.copyWith(password: password, isButtonActive: isButtonActive));
  }

  Future<void> onLoginButtonPressed() async {
    try {
      debugPrint("pressed");
      if (!state.isButtonActive) return;

      emit(state.copyWith(status: LoginStatus.loading));
      await _authService.signIn(
        signInModel: SignInModel(email: state.login, password: state.password),
      );
    } catch (error) {
      logger.e(error);
      emit(state.copyWith(status: LoginStatus.failure));
    }
  }
}
