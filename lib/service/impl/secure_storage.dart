import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../storage.dart';

class SecureStorageService implements StorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService.create() : _storage = const FlutterSecureStorage();

  @override
  Future<String?> read(String key) => _storage.read(key: key);

  @override
  Future<bool?> readBool(String key) async {
    final value = await read(key);
    return value == true.toString();
  }

  @override
  Future write(String key, String? value) {
    if (value == null) {
      return _storage.delete(key: key);
    }
    return _storage.write(key: key, value: value);
  }

  @override
  Future writeBool(String key, bool? value) => write(key, value?.toString());
}
