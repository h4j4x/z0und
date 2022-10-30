import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/theme.dart';

class ThemeChanger {
  static ThemeMode nextThemeMode(AppTheme appTheme) {
    final modeIndex = ThemeMode.values.indexOf(appTheme.themeMode);
    final nextIndex = (modeIndex + 1) % ThemeMode.values.length;
    return ThemeMode.values[nextIndex];
  }

  static void setNextThemeMode(BuildContext context) {
    final appTheme = context.read<AppTheme>();
    appTheme.themeMode = nextThemeMode(appTheme);
  }
}
