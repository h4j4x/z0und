import 'package:flutter/material.dart';

import '../handler/impl/dropbox_handler.dart';
import '../handler/impl/google_handler.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN TODO'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          if (dropboxEnabled)
            authButton(
              title: 'DROPBOX TODO',
              linked: dropboxLinked,
              onAction: onDropbox,
            ),
          if (googleEnabled)
            authButton(
              title: 'GOOGLE TODO',
              linked: googleLinked,
              onAction: onGoogle,
            ),
        ],
      ),
    );
  }

  void onDropbox() async {
    if (dropboxLinked == true) {
      await confirmUnlink('Are you sure to unlink Dropbox TODO?');
    } else if (dropboxLinked == false) {
      await OpenidLoginPage.pushRouteTo(
        context,
        title: 'DROPBOX TODO',
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
      await confirmUnlink('Are you sure to unlink Google TODO?');
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

  Future confirmUnlink(String description) => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Please Confirm TODO'),
          content: Text(description),
          actions: [
            TextButton(
              onPressed: () {
                DropboxHandler().removeAuth();
                Navigator.of(context).pop();
              },
              child: const Text('Yes TODO'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No TODO'),
            )
          ],
        );
      });

  Widget authButton({
    required String title,
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
        color: Theme.of(context).colorScheme.primary, // todo .success
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
      title: Text(title),
      trailing: trailing,
      onTap: (linked != null) ? onAction : null,
    );
  }
}
