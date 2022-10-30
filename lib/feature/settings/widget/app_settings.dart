import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/l10n/app_l10n.g.dart';
import '../../../app/theme.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  static const _maxWidth = 600.0;
  static const _paddingSize = 22.0;

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
      ],
    );
  }

  Widget _themeModeSwitch(BuildContext context) {
    final appTheme = context.watch<AppTheme>();
    final l10n = L10n.of(context);
    IconData icon;
    String label;
    switch (appTheme.themeMode) {
      case ThemeMode.system:
        icon = Icons.brightness_auto_sharp;
        label = l10n.systemMode;
        break;
      case ThemeMode.light:
        icon = Icons.light_mode_sharp;
        label = l10n.lightMode;
        break;
      case ThemeMode.dark:
        icon = Icons.dark_mode_sharp;
        label = l10n.darkMode;
        break;
    }
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(l10n.themeMode),
      onTap: () => _onChangeThemeMode(context),
    );
  }

  void _onChangeThemeMode(BuildContext context) {
    final appTheme = context.read<AppTheme>();
    final modeIndex = ThemeMode.values.indexOf(appTheme.themeMode);
    final nextIndex = (modeIndex + 1) % ThemeMode.values.length;
    appTheme.themeMode = ThemeMode.values[nextIndex];
  }
}
