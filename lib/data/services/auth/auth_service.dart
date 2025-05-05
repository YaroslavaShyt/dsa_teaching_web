import 'package:dsa_teaching_web/core/utils/logger/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/auth/iauth_repository.dart';
import '../../../domain/auth/iauth_response.dart';
import '../../../domain/auth/isign_in_model.dart';
import '../../../domain/services/auth/iauth_service.dart';
import '../../../domain/services/auth/itoken_service.dart';
import 'auth_state.dart';

class AuthService extends Cubit<AuthState> implements IAuthService {
  AuthService({
    required ITokenService tokenService,
    required IAuthRepository repository,
  })  : _tokenService = tokenService,
        _repository = repository,
        super(const AuthState());

  final ITokenService _tokenService;
  final IAuthRepository _repository;

  @override
  Future<void> checkAuth() async {
    try {
      final String? token = await _tokenService.getToken();
      if (token == null) {
        emit(state.copyWith(status: AuthStatus.notAuthorized));
        return;
      }

      emit(state.copyWith(status: AuthStatus.authorized));
    } catch (error) {
      logger.e(error);
    }
  }

  @override
  Future<void> signIn({required ISignInModel signInModel}) async {
    try {
      final IAuthResponse? response = await _repository.signIn(signInModel);
      if (response == null) {
        emit(state.copyWith(status: AuthStatus.notAuthorized));
        return;
      }
      await _tokenService.saveToken(response);
      emit(state.copyWith(status: AuthStatus.authorized));
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _tokenService.clearToken();
      emit(state.copyWith(status: AuthStatus.notAuthorized));
    } catch (error) {
      logger.e(error);
    }
  }
}
