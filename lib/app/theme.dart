import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

const flexScheme = FlexScheme.ebonyClay;
final fontFamily = GoogleFonts.notoSans().fontFamily;
final visualDensity = FlexColorScheme.comfortablePlatformDensity;

final lightTheme = FlexThemeData.light(
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 20,
  appBarOpacity: 0.95,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    blendOnColors: false,
  ),
  visualDensity: visualDensity,
  useMaterial3: true,
  fontFamily: fontFamily,
);

final darkTheme = FlexThemeData.dark(
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 15,
  appBarOpacity: 0.90,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 30,
  ),
  visualDensity: visualDensity,
  useMaterial3: true,
  fontFamily: fontFamily,
);
