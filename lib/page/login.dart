import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_l10n.dart';

import '../handler/impl/dropbox_handler.dart';
import '../handler/impl/google_handler.dart';
import '../theme.dart';
import 'openid_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  static Future<dynamic> pushRouteTo(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute<dynamic>(
      builder: (context) => const LoginPage(),
    ));
  }
}

class _LoginPageState extends State<LoginPage> {
  bool dropboxEnabled = false;
  bool? dropboxLinked;

  bool googleEnabled = false;
  bool? googleLinked;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      setState(() {
        dropboxEnabled = DropboxHandler().isEnabled;
        googleEnabled = GoogleHandler().isEnabled;
      });
      updateDropboxLinked();
      updateGoogleLinked();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.connectedAccounts),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          if (dropboxEnabled)
            authButton(
              linkedTitle: l10n.dropboxConnected,
              notLinkedTitle: l10n.connectDropbox,
              linked: dropboxLinked,
              onAction: onDropbox,
            ),
          if (googleEnabled)
            authButton(
              linkedTitle: l10n.googleConnected,
              notLinkedTitle: l10n.connectGoogle,
              linked: googleLinked,
              onAction: onGoogle,
            ),
        ],
      ),
    );
  }

  void onDropbox() async {
    final l10n = L10n.of(context);
    if (dropboxLinked == true) {
      await confirmUnlink(l10n.confirmToUnlinkDropbox);
    } else if (dropboxLinked == false) {
      await OpenidLoginPage.pushRouteTo(
        context,
        title: l10n.connectDropbox,
        handler: DropboxHandler(),
      );
    }
    updateDropboxLinked();
  }

  void updateDropboxLinked() async {
    if (dropboxEnabled) {
      final dropboxToken = await DropboxHandler().authToken;
      setState(() {
        dropboxLinked = dropboxToken != null;
      });
    }
  }

  void onGoogle() async {
    if (googleLinked == true) {
      await confirmUnlink(L10n.of(context).confirmToUnlinkGoogle);
    } else if (googleLinked == false) {
      await GoogleHandler().auth();
    }
    updateGoogleLinked();
  }

  void updateGoogleLinked() async {
    if (googleEnabled) {
      final hasAccount = await GoogleHandler().hasAccount;
      setState(() {
        googleLinked = hasAccount;
      });
    }
  }

  Future confirmUnlink(String description) {
    final l10n = L10n.of(context);
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(l10n.confirmToUnlink),
            content: Text(description),
            actions: [
              TextButton(
                onPressed: () {
                  DropboxHandler().removeAuth();
                  Navigator.of(context).pop();
                },
                child: Text(l10n.yes),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(l10n.no),
              )
            ],
          );
        });
  }

  Widget authButton({
    required String linkedTitle,
    required String notLinkedTitle,
    required bool? linked,
    required VoidCallback onAction,
  }) {
    Widget leading;
    Widget? trailing;
    if (linked == null) {
      leading = const SizedBox(
        width: 20.0,
        height: 20.0,
        child: CircularProgressIndicator.adaptive(),
      );
    } else if (linked == true) {
      leading = Icon(
        Icons.check_circle_sharp,
        color: Theme.of(context).colorScheme.success,
      );
      trailing = Icon(
        Icons.delete_sharp,
        color: Theme.of(context).colorScheme.error,
      );
    } else {
      leading = Icon(
        Icons.cancel_sharp,
        color: Theme.of(context).colorScheme.error,
      );
      trailing = const Icon(Icons.arrow_forward_sharp);
    }
    return ListTile(
      leading: leading,
      title: Text(linked == true ? linkedTitle : notLinkedTitle),
      trailing: trailing,
      onTap: (linked != null) ? onAction : null,
    );
  }
}
