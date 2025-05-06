import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../widgets/universal_webview.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  WebViewController? _controller;
  bool _canGoBack = false;
  bool _canGoForward = false;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse('https://www.ydnbu-mailbox.work.gd/'))
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageFinished: (url) async {
              final canGoBack = await _controller!.canGoBack();
              final canGoForward = await _controller!.canGoForward();
              setState(() {
                _canGoBack = canGoBack;
                _canGoForward = canGoForward;
              });
            },
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ရတနာပုံတက္ကသိုလ်'),
      ),
      body: UniversalWebView(
        url: 'https://www.ydnbu-mailbox.work.gd/',
        controller: _controller,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: kIsWeb ? null : (_canGoBack ? () => _controller!.goBack() : null),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: kIsWeb ? null : (_canGoForward ? () => _controller!.goForward() : null),
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: kIsWeb ? null : () => _controller!.reload(),
            ),
          ],
        ),
      ),
    );
  }
} 