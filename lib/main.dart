import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'vendor/dropbox_handler.dart';
import 'z0und.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  final dropboxOpenidHandler = await DropboxOpenidHandler.create();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => dropboxOpenidHandler),
      ],
      child: const Z0undApp(),
    ),
  );
}
