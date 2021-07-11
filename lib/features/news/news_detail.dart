import 'dart:async';

import 'package:cric_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class NewsDetail extends StatefulWidget {
  String url;
  NewsDetail(this.url);
  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  final Completer<WebViewController> controller =
      Completer<WebViewController>();
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('', true),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            onWebViewCreated: (WebViewController webViewController) {
              controller.complete(webViewController);
            },
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
    );
  }
}
