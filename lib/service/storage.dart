import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../ioc.dart';

abstract class StorageService {
  static StorageService create() => SecureStorageService._();

  factory StorageService() => Ioc.get<StorageService>();

  Future<String?> read(String key);

  Future write(String key, String? value);
}

class SecureStorageService implements StorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService._() : _storage = const FlutterSecureStorage();

  @override
  Future<String?> read(String key) => _storage.read(key: key);

  @override
  Future write(String key, String? value) {
    if (value == null) {
      return _storage.delete(key: key);
    }
    return _storage.write(key: key, value: value);
  }
}
