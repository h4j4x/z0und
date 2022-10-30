import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/theme.dart';

class ThemeChanger {
  static void setNextThemeMode(BuildContext context) {
    final appTheme = context.read<AppTheme>();
    final modeIndex = ThemeMode.values.indexOf(appTheme.themeMode);
    final nextIndex = (modeIndex + 1) % ThemeMode.values.length;
    appTheme.themeMode = ThemeMode.values[nextIndex];
  }

  static void setLocale(String locale) {}
}
