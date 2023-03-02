import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'vendor/dropbox_handler.dart';
import 'z0und.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DropboxOpenidHandler.create()),
      ],
      child: const Z0undApp(),
    ),
  );
}
