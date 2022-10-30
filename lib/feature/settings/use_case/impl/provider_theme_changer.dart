import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/theme.dart';
import '../theme_changer.dart';

class ProviderThemeChanger implements ThemeChanger {
  @override
  ThemeMode getNextThemeMode(AppTheme appTheme) {
    final modeIndex = ThemeMode.values.indexOf(appTheme.themeMode);
    final nextIndex = (modeIndex + 1) % ThemeMode.values.length;
    return ThemeMode.values[nextIndex];
  }

  @override
  void setNextThemeMode(BuildContext context) {
    final appTheme = context.read<AppTheme>();
    appTheme.themeMode = getNextThemeMode(appTheme);
  }
}
