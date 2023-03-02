import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';

import 'page/login.dart';

class Z0undApp extends StatelessWidget {
  const Z0undApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'z0und',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class Z0undConfig {
  static const dropboxClientId = 'DROPBOX_CLIENT_ID';

  static String getConfig(String key) {
    return FlutterConfig.get(key);
  }
}
