import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../storage.dart';

class SecureStorageService implements StorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService.create() : _storage = const FlutterSecureStorage();

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
