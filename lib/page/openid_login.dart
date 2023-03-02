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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: processing
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : WebBrowser(
                initialUrl: widget.authUrl,
                listener: this,
              ),
      ),
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
      if (error == null && mounted) {
        Navigator.of(context).pop();
      }
      if (error != null) {
        // todo: alert with error, allow retry or exit
      }
    }
  }
}
