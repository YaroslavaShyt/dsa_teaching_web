import 'iuser.dart';

abstract interface class IUserRepository {
  Future<IUser?> getUser();

  Future<List<IUser>> getAllUsers();

  Future<void> updateUser(Map<String, String> data);

  Future<bool> deleteUser();
}
