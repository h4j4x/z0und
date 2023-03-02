import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:provider/provider.dart';

import 'vendor/dropbox_handler.dart';
import 'z0und.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DropboxOpenidHandler.create()),
      ],
      child: const Z0undApp(),
    ),
  );
}
