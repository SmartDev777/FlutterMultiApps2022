import 'dart:io';

 import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class SimpleWebview extends StatefulWidget {
  const SimpleWebview({Key? key}) : super(key: key);

  @override
  State<SimpleWebview> createState() => _SimpleWebviewState();
}

class _SimpleWebviewState extends State<SimpleWebview> {
  @override
   void initState() {
     super.initState();
     // Enable virtual display.
     if (Platform.isAndroid) WebView.platform = AndroidWebView();
   }

   @override
   Widget build(BuildContext context) {
     return WebView(
       initialUrl: 'https://flutter.dev',
     );
   }
}
