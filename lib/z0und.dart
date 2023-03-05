import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'page/login.dart';

class Z0undApp extends StatelessWidget {
  const Z0undApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'z0und',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}

class Z0undConfig {
  Z0undConfig._();

  static Future load() => dotenv.load(fileName: '.env');

  static String? get dropboxClientId => _read('DROPBOX_CLIENT_ID');

  static String? get dropboxClientSecret => _read('DROPBOX_CLIENT_SECRET');

  static String? get dropboxRedirectUri => _read('DROPBOX_REDIRECT_URI');

  static String? _read(String key) => dotenv.env[key];
}
