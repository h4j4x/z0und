import 'package:flutter/material.dart';

import '../vendor/dropbox_handler.dart';
import 'openid_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool dropboxEnabled = false;
  bool? dropboxLinked;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      setState(() {
        dropboxEnabled = DropboxHandler.of(context, listen: false).isEnabled;
      });
      if (dropboxEnabled) {
        updateDropboxLinked();
      }
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
      // todo: remove dropbox authentication with confirm dialog
    }
    if (dropboxLinked == false) {
      await OpenidLoginPage.pushRouteTo(
        context,
        title: title,
        authUrl: DropboxHandler.of(context, listen: false).authUrl(),
        handlerGetter: (context) => DropboxHandler.of(context, listen: false),
      );
    }
    updateDropboxLinked();
  }

  void updateDropboxLinked() async {
    final dropboxToken =
        await DropboxHandler.of(context, listen: false).authToken;
    setState(() {
      dropboxLinked = dropboxToken != null;
    });
  }
}
