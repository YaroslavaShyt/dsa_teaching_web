import 'iauth_response.dart';
import 'isign_in_model.dart';

abstract interface class IAuthRepository {
  Future<IAuthResponse?> signIn(ISignInModel model);
}
