import 'package:flutter/material.dart';

import '../handler/openid_handler.dart';
import '../widget/message_options.dart';
import '../widget/web_browser.dart';

class OpenidLoginPage extends StatefulWidget {
  final String title;
  final OpenidHandler handler;

  const OpenidLoginPage({
    super.key,
    required this.title,
    required this.handler,
  });

  @override
  State<OpenidLoginPage> createState() => _OpenidLoginPageState();

  static Future<dynamic> pushRouteTo(
    BuildContext context, {
    required String title,
    required OpenidHandler handler,
  }) {
    return Navigator.of(context).push(MaterialPageRoute<dynamic>(
      builder: (context) => OpenidLoginPage(
        title: title,
        handler: handler,
      ),
    ));
  }
}

class _OpenidLoginPageState extends State<OpenidLoginPage>
    implements WebBrowserListener {
  bool processing = false;
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: body(),
      ),
    );
  }

  Widget body() {
    if (error != null) {
      return MessageOptionsWidget(
        message: error!,
        messageColor: Theme.of(context).colorScheme.error,
        options: [
          ListTile(
            leading: const Icon(Icons.arrow_back_sharp),
            title: const Text('EXIT TODO'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    }
    if (processing) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }
    return WebBrowser(
      initialUrl: widget.handler.authUrl,
      listener: this,
    );
  }

  @override
  void onLoadedUrl(String url) async {
    if (widget.handler.canProcessUrl(url)) {
      setState(() {
        processing = true;
      });
      final error = await widget.handler.processUrl(url);
      setState(() {
        this.error = error;
        processing = false;
      });
      if (error == null && mounted) {
        Navigator.of(context).pop();
      }
    }
  }
}
