import 'package:flutter/material.dart';

import '../../feature/settings/widget/settings.dart';
import '../l10n/app_l10n.g.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).settings),
        backgroundColor: Colors.transparent,
      ),
      body: const SafeArea(
        child: SettingsWidget(),
      ),
    );
  }
}
