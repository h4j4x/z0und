import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme with ChangeNotifier {
  final FlexScheme _flexScheme;
  final String? _fontFamily;
  ThemeMode _themeMode;

  late ThemeData _lightTheme;
  late ThemeData _darkTheme;

  AppTheme()
      : _flexScheme = FlexScheme.damask,
        _fontFamily = GoogleFonts.notoSans().fontFamily,
        _themeMode = ThemeMode.system {
    _lightTheme = _createLightTheme(_flexScheme, _fontFamily);
    _darkTheme = _createDarkTheme(_flexScheme, _fontFamily);
  }

  ThemeMode get themeMode => _themeMode;

  ThemeData get lightTheme => _lightTheme;

  ThemeData get darkTheme => _darkTheme;

  set themeMode(ThemeMode value) {
    _themeMode = value;
    notifyListeners();
  }
}

final _visualDensity = FlexColorScheme.comfortablePlatformDensity;
const _surfaceMode = FlexSurfaceMode.highScaffoldLowSurface;

ThemeData _createLightTheme(FlexScheme scheme, String? fontFamily) =>
    FlexThemeData.light(
      scheme: scheme,
      surfaceMode: _surfaceMode,
      blendLevel: 20,
      appBarOpacity: 0.95,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        blendOnColors: false,
      ),
      visualDensity: _visualDensity,
      useMaterial3: true,
      fontFamily: fontFamily,
      appBarElevation: 0.0,
    );

ThemeData _createDarkTheme(FlexScheme scheme, String? fontFamily) =>
    FlexThemeData.dark(
      scheme: scheme,
      surfaceMode: _surfaceMode,
      blendLevel: 15,
      appBarOpacity: 0.90,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 30,
      ),
      visualDensity: _visualDensity,
      useMaterial3: true,
      fontFamily: fontFamily,
      appBarElevation: 0.0,
    );
