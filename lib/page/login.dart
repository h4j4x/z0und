import 'package:flutter/material.dart';

import '../auth/openid_handler.dart';
import 'openid_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final OpenidHandler dropboxOpenidHandler = DropboxOpenidHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN TODO'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          dropboxButton(),
        ],
      ),
    );
  }

  Widget dropboxButton() {
    const title = 'DROPBOX TODO';
    return ListTile(
      leading: const Icon(Icons.abc),
      title: const Text(title),
      trailing: const Icon(Icons.arrow_forward_sharp),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<void>(
          builder: (context) => OpenidLoginPage(
            title: title,
            handler: dropboxOpenidHandler,
          ),
        ));
      },
    );
  }
}
