import 'package:dsa_teaching_web/domain/user/iuser.dart';
import 'package:dsa_teaching_web/domain/user/iuser_learned_lessons.dart';

abstract interface class IUserService {
  IUser? get user;

  Future<void> init();

  Future<List<IUser>> getAllUsers();

  Future<List<IUserLearnedLessons>> getAllUserLessons(int id);

  Future<void> cleanUserData();

  Future<void> deleteUser();
}
