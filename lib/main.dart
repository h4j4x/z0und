import 'package:flutter/material.dart';

import 'ioc.dart';
import 'z0und.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupIoc();
  runApp(const Z0undApp());
}
