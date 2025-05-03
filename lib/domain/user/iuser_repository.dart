import 'package:dsa_teaching_web/domain/user/iuser_learned_lessons.dart';

import 'iuser.dart';

abstract interface class IUserRepository {
  Future<IUser?> getUser();

  Future<List<IUser>> getAllUsers();

  Future<void> updateUser(Map<String, String> data);

  Future<bool> deleteUser();

  Future<List<IUserLearnedLessons>> getUserLearnedLessons(int id);
}
