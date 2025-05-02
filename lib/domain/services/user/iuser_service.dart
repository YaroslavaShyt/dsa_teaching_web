import 'package:dsa_teaching_web/domain/user/iuser.dart';

abstract interface class IUserService {
  IUser? get user;

  Future<void> init();

  Future<List<IUser>> getAllUsers();

  Future<void> cleanUserData();

  Future<void> deleteUser();
}
