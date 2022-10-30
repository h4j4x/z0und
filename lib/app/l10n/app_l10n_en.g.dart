import 'app_l10n.g.dart';

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Z0und';

  @override
  String get mute => 'Mute';

  @override
  String get pause => 'Pause';

  @override
  String get play => 'Play';

  @override
  String get replay => 'Replay';

  @override
  String trackDuration(String value) {
    return 'Track duration: $value';
  }

  @override
  String trackPosition(String value) {
    return 'Track position: $value';
  }

  @override
  String volumeValue(String value) {
    return 'Volume: $value%';
  }
}
