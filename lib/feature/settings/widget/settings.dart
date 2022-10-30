import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/l10n/app_l10n.g.dart';
import '../../../app/theme.dart';
import '../use_case/theme_changer.dart';

class SettingsWidget extends StatelessWidget {
  final ThemeChanger _themeChanger;

  SettingsWidget({super.key}) : _themeChanger = ThemeChanger.create();

  static const _maxWidth = 600.0;
  static const _paddingSize = 22.0;
  static const _smallIconSize = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: _maxWidth,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: _paddingSize * 1.2,
      ),
      child: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _themeModeSwitch(context),
        const Divider(),
      ],
    );
  }

  Widget _themeModeSwitch(BuildContext context) {
    final appTheme = context.watch<AppTheme>();
    final l10n = L10n.of(context);
    return ListTile(
      leading: Icon(_iconOf(appTheme.themeMode)),
      title: Text(_labelOf(appTheme.themeMode, l10n)),
      subtitle: Text(l10n.themeMode),
      trailing: ElevatedButton.icon(
        onPressed: () => _onNextThemeMode(context),
        icon: Icon(
          Icons.arrow_forward_sharp,
          size: _smallIconSize,
          semanticLabel: l10n.changeThemeMode,
        ),
        label: Icon(_iconOf(_themeChanger.getNextThemeMode(appTheme))),
      ),
      onTap: () => _onNextThemeMode(context),
    );
  }

  IconData _iconOf(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return Icons.brightness_auto_sharp;
      case ThemeMode.light:
        return Icons.light_mode_sharp;
      case ThemeMode.dark:
        return Icons.dark_mode_sharp;
    }
  }

  String _labelOf(ThemeMode themeMode, L10n l10n) {
    switch (themeMode) {
      case ThemeMode.system:
        return l10n.systemMode;
      case ThemeMode.light:
        return l10n.lightMode;
      case ThemeMode.dark:
        return l10n.darkMode;
    }
  }

  void _onNextThemeMode(BuildContext context) {
    _themeChanger.setNextThemeMode(context);
  }
}
