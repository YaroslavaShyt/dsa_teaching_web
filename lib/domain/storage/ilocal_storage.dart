abstract interface class ILocalStorage {
  Future<dynamic> create({
    required String key,
    required dynamic value,
  });

  Future<dynamic> read({
    required String key,
  });

  Future<dynamic> update({
    required String key,
    required dynamic value,
  });

  Future<dynamic> delete({
    required String key,
  });
}
