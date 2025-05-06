import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Only import dart:html and dart:ui if on web
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui' as ui;

class UniversalWebView extends StatelessWidget {
  final String url;
  final WebViewController? controller;
  const UniversalWebView({super.key, required this.url, this.controller});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      // Register the view type
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
        url,
        (int viewId) => html.IFrameElement()
          ..src = url
          ..style.border = 'none'
          ..width = '100%'
          ..height = '100%',
      );
      return HtmlElementView(viewType: url);
    } else {
      return WebViewWidget(
        controller: controller!,
      );
    }
  }
} 