import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../config.dart';

class DotenvConfigService implements ConfigService {
  DotenvConfigService._();

  static Future<ConfigService> create() async {
    await dotenv.load(fileName: '.env');
    return DotenvConfigService._();
  }

  @override
  String? read(String key) => dotenv.env[key];
}
