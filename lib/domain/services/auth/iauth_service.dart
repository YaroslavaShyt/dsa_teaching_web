import 'package:dsa_teaching_web/data/services/auth/auth_state.dart';
import 'package:dsa_teaching_web/domain/auth/isign_in_model.dart';

abstract interface class IAuthService {
  Future<void> checkAuth();

  Future<void> signIn({
    required ISignInModel signInModel,
  });

  Future<void> signOut();

  Stream<AuthState> get stream;
}
