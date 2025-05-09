import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/storage/ilocal_storage.dart';

class LocalStorage implements ILocalStorage {
  LocalStorage({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @override
  Future<void> create({required String key, required value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);

    if (value is String) {
      await prefs.setString(key, value);
      return;
    }
    if (value is int) {
      await prefs.setInt(key, value);
      return;
    }
    if (value is double) {
      await prefs.setDouble(key, value);
      return;
    }
    if (value is bool) {
      await prefs.setBool(key, value);
      return;
    }
    if (value is List<String>) {
      await prefs.setStringList(key, value);
      return;
    }
    throw ArgumentError('Unsupported value type');
  }

  @override
  Future<void> delete({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
    await prefs.reload();
  }

  @override
  Future<dynamic> read({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.get(key);
  }

  @override
  Future<void> update({required String key, required value}) async {
    await create(key: key, value: value);
  }
}
