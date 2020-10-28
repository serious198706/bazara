import 'package:bazara/resources/themes.dart';
import 'package:bazara/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatefulWidget {
  final String title;
  final String url;

  const ArticlePage({this.title, this.url});

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
          title: widget.title,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (_) {
                setState(() {
                  _loading = false;
                });
              },
            ),
            if (_loading) Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: LinearProgressIndicator(
                value: 0.8,
                backgroundColor: dividerColor,
                valueColor: AlwaysStoppedAnimation(accentColor),
              ),
            )
          ],
        )
    );
  }
}
