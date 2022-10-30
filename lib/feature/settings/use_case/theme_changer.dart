import 'package:flutter/material.dart';

import '../../../app/theme.dart';
import 'impl/provider_theme_changer.dart';

abstract class ThemeChanger {
  ThemeMode getNextThemeMode(AppTheme appTheme);

  void setNextThemeMode(BuildContext context);

  static ThemeChanger create() => ProviderThemeChanger();
}
