import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/storage/ilocal_storage.dart';

class LocalStorage implements ILocalStorage {
  LocalStorage({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @override
  Future<void> create({required String key, required value}) async {
    if (value is String) {
      await _sharedPreferences.setString(key, value);
    } else if (value is int) {
      await _sharedPreferences.setInt(key, value);
    } else if (value is double) {
      await _sharedPreferences.setDouble(key, value);
    } else if (value is bool) {
      await _sharedPreferences.setBool(key, value);
    } else if (value is List<String>) {
      await _sharedPreferences.setStringList(key, value);
    } else {
      throw ArgumentError('Unsupported value type');
    }
  }

  @override
  Future<void> delete({required String key}) async {
    await _sharedPreferences.remove(key);
  }

  @override
  Future<dynamic> read({required String key}) async {
    return _sharedPreferences
        .get(key); // Returns the value associated with the key
  }

  @override
  Future<void> update({required String key, required value}) async {
    await delete(key: key); // Remove existing value if any
    await create(key: key, value: value); // Set new value
  }
}
