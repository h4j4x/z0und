import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// https://docs.flexcolorscheme.com/
FlexScheme _scheme() => FlexScheme.sanJuanBlue; // todo: from settings or config

/// https://pub.dev/packages/google_fonts#font-bundling-in-assets
String? _fontFamily() => GoogleFonts.notoSans().fontFamily;

const _visualDensity = VisualDensity.standard;

void initTheme() {
  GoogleFonts.config.allowRuntimeFetching = false;
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
}

ThemeData? lightTheme() {
  return FlexThemeData.light(
    scheme: _scheme(),
    visualDensity: _visualDensity,
    useMaterial3: true,
    fontFamily: _fontFamily(),
  );
}

ThemeData? darkTheme() {
  return FlexThemeData.dark(
    scheme: _scheme(),
    visualDensity: _visualDensity,
    useMaterial3: true,
    fontFamily: _fontFamily(),
  );
}
