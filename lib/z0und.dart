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

  static const dropboxClientId = 'DROPBOX_CLIENT_ID';
  static const dropboxClientSecret = 'DROPBOX_CLIENT_SECRET';
  static const dropboxRedirectUri = 'DROPBOX_REDIRECT_URI';

  static String? read(String key) => dotenv.env[key];
}
