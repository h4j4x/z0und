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
      final dropboxOpenidHandler =
          DropboxOpenidHandler.of(context, listen: false);
      setState(() {
        dropboxEnabled = dropboxOpenidHandler.isEnabled;
      });
      if (dropboxEnabled) {
        final dropboxToken = await dropboxOpenidHandler.authToken;
        setState(() {
          dropboxLinked = dropboxToken != null;
        });
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
    Widget icon;
    if (dropboxLinked == null) {
      icon = const SizedBox(
        width: 20.0,
        height: 20.0,
        child: CircularProgressIndicator.adaptive(),
      );
    } else if (dropboxLinked == true) {
      icon = const Icon(Icons.check_circle_sharp);
    } else {
      icon = const Icon(Icons.cancel_sharp);
    }
    return ListTile(
      leading: icon,
      title: const Text(title),
      trailing: const Icon(Icons.arrow_forward_sharp),
      onTap: (dropboxLinked != null)
          ? () {
              Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (context) => OpenidLoginPage(
                  title: title,
                  authUrl:
                      DropboxOpenidHandler.of(context, listen: false).authUrl(),
                  handlerGetter: (context) =>
                      DropboxOpenidHandler.of(context, listen: false),
                ),
              ));
            }
          : null,
    );
  }
}
