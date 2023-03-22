import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'ioc.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Ioc.createServices();
  initTheme();
  runApp(
    MultiProvider(
      providers: Ioc.createProviders(),
      child: const App(),
    ),
  );
}
