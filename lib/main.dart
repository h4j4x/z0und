import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'ioc.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initTheme();
  await Ioc.createServices();
  final providers = await Ioc.createProviders();
  runApp(
    MultiProvider(
      providers: providers,
      child: const App(),
    ),
  );
}
