import 'package:dsa_teaching_web/domain/user/iuser.dart';

abstract interface class IUserService {
  IUser? get user;

  Future<void> init();

  Future<void> updateUser({
    String? name,
  });

  Future<void> cleanUserData();

  Future<void> deleteUser();
}
