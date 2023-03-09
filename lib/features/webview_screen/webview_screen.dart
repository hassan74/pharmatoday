import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webviewcreen extends StatefulWidget {
  const Webviewcreen({super.key});

  @override
  State<Webviewcreen> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<Webviewcreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
        //  ..loadRequest(Uri.parse('https://www.youtube.com/')
          ..loadRequest(Uri.parse('http://pharmatoday-magazine.com/')
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharma Today'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
