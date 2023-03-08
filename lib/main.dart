import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ioc.dart';
import 'service/audio_player.dart';
import 'z0und.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupIoc();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AudioPlayer.create()),
      ],
      child: const Z0undApp(),
    ),
  );
}
