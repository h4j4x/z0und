import 'package:flutter/material.dart';

import '../vendor/openid_handler.dart';
import '../widget/web_browser.dart';

typedef OpenidHandlerGetter = OpenidHandler Function(BuildContext context);

class OpenidLoginPage extends StatefulWidget {
  final String title;
  final String authUrl;
  final OpenidHandlerGetter handlerGetter;

  const OpenidLoginPage({
    super.key,
    required this.title,
    required this.authUrl,
    required this.handlerGetter,
  });

  @override
  State<OpenidLoginPage> createState() => _OpenidLoginPageState();
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
      return ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Text(
            error!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
            ),
            textScaleFactor: 1.6,
          ),
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
      initialUrl: widget.authUrl,
      listener: this,
    );
  }

  @override
  void onLoadedUrl(String url) async {
    final handler = widget.handlerGetter(context);
    if (handler.canProcessUrl(url)) {
      setState(() {
        processing = true;
      });
      final error = await handler.processUrl(url);
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
