import 'package:flutter/material.dart';

import 'service/ioc.dart';
import 'z0und.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Z0undConfig.load();
  await setupIoc();
  runApp(const Z0undApp());
}
