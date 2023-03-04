import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

abstract class WebBrowserListener {
  void onLoadedUrl(String url);
}

class WebBrowser extends StatefulWidget {
  final String initialUrl;
  final WebBrowserListener listener;

  const WebBrowser({
    super.key,
    required this.initialUrl,
    required this.listener,
  });

  @override
  State<WebBrowser> createState() => _WebBrowserState();
}

class _WebBrowserState extends State<WebBrowser> {
  final webKey = GlobalKey();
  final settings = InAppWebViewSettings();

  InAppWebViewController? webController;
  PullToRefreshController? pullToRefreshController;
  double loadingProgress = .0;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      pullToRefreshController = PullToRefreshController(onRefresh: onRefresh);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InAppWebView(
          key: webKey,
          initialUrlRequest: URLRequest(url: WebUri(widget.initialUrl)),
          initialSettings: settings,
          pullToRefreshController: pullToRefreshController,
          onWebViewCreated: (controller) {
            webController = controller;
          },
          onLoadStart: (controller, url) {
            widget.listener.onLoadedUrl(url.toString());
          },
          onPermissionRequest: (controller, request) async {
            return PermissionResponse(
              resources: request.resources,
              action: PermissionResponseAction.GRANT,
            );
          },
          onLoadStop: (controller, url) async {
            pullToRefreshController?.endRefreshing();
          },
          onReceivedError: (controller, request, error) {
            pullToRefreshController?.endRefreshing();
          },
          onProgressChanged: (controller, progress) {
            if (mounted) {
              setState(() {
                loadingProgress = progress / 100.0;
              });
            }
            if (progress >= 100) {
              pullToRefreshController?.endRefreshing();
            }
          },
        ),
        loadingProgress < 1.0
            ? LinearProgressIndicator(value: loadingProgress)
            : Container(),
      ],
    );
  }

  void onRefresh() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      webController?.reload();
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      webController?.loadUrl(
          urlRequest: URLRequest(url: await webController?.getUrl()));
    }
  }

  @override
  void dispose() {
    webController?.stopLoading();
    webController?.pause();
    super.dispose();
  }
}
