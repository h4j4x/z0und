import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../ioc.dart';

abstract class StorageService {
  static StorageService create() => SecureStorageService._();

  factory StorageService() => Ioc.get<StorageService>();

  Future<String?> read(String key);

  Future write(String key, String? value);
}

class SecureStorageService implements StorageService {
  final FlutterSecureStorage _secureStorage;

  SecureStorageService._() : _secureStorage = const FlutterSecureStorage();

  @override
  Future<String?> read(String key) => _secureStorage.read(key: key);

  @override
  Future write(String key, String? value) {
    if (value == null) {
      return _secureStorage.delete(key: key);
    }
    return _secureStorage.write(key: key, value: value);
  }
}
