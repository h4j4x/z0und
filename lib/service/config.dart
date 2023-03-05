import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

abstract class ConfigService {
  static Future<ConfigService> create() => DotenvConfigService._create();

  factory ConfigService() => GetIt.I<ConfigService>();

  String? read(String key);
}

class DotenvConfigService implements ConfigService {
  DotenvConfigService._();

  static Future<ConfigService> _create() async {
    await dotenv.load(fileName: '.env');
    return DotenvConfigService._();
  }

  @override
  String? read(String key) => dotenv.env[key];
}
