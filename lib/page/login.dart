import 'package:flutter/material.dart';

import '../handler/dropbox_handler.dart';
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

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      setState(() {
        dropboxEnabled = DropboxHandler().isEnabled;
      });
      updateDropboxLinked();
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
          if (dropboxEnabled) dropboxButton(),
        ],
      ),
    );
  }

  Widget dropboxButton() {
    const title = 'DROPBOX TODO';
    Widget leading;
    Widget? trailing;
    if (dropboxLinked == null) {
      leading = const SizedBox(
        width: 20.0,
        height: 20.0,
        child: CircularProgressIndicator.adaptive(),
      );
    } else if (dropboxLinked == true) {
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
      title: const Text(title),
      trailing: trailing,
      onTap: (dropboxLinked != null) ? () => onDropbox(title) : null,
    );
  }

  void onDropbox(String title) async {
    if (dropboxLinked == true) {
      await confirmUnlinkDropbox();
    } else if (dropboxLinked == false) {
      await OpenidLoginPage.pushRouteTo(
        context,
        title: title,
        handler: DropboxHandler(),
      );
    }
    updateDropboxLinked();
  }

  Future confirmUnlinkDropbox() => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Please Confirm TODO'),
          content: const Text('Are you sure to unlink dropbox TODO?'),
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

  void updateDropboxLinked() async {
    if (dropboxEnabled) {
      final dropboxToken = await DropboxHandler().authToken;
      setState(() {
        dropboxLinked = dropboxToken != null;
      });
    }
  }
}
