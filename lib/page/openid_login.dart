import 'package:flutter/material.dart';

import '../auth/openid_handler.dart';
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
                initialUrl: widget.handler.authUrl(),
                listener: this,
              ),
      ),
    );
  }

  @override
  void onLoadedUrl(String url) async {
    if (widget.handler.canProcessUrl(url)) {
      setState(() {
        processing = true;
      });
      final error = await widget.handler.processUrl(url);
      if (error == null && mounted) {
        Navigator.of(context).pop();
      }
      if (error != null) {
        // todo: alert with error, allow retry or exit
      }
    }
  }
}
