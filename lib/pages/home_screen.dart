import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  InAppWebViewController webView;
  String url = "";
  double progress = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                  "CURRENT URL\n${(url.length > 50) ? url.substring(0, 50) + "..." : url}"),
            ),
            (progress != 1.0) ? LinearProgressIndicator(value: progress) : null,
            Container(
              height: 200,
              margin: const EdgeInsets.all(0.0),
              padding: EdgeInsets.all(0.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: InAppWebView(
                //initialUrl: "https://www.baidu.com/",
                initialFile: "assets/test_base64(4).html",
                initialHeaders: {},
                initialOptions: {},
                onWebViewCreated: (InAppWebViewController controller) {
                  webView = controller;
                },
                onLoadStart: (InAppWebViewController controller, String url) {
                  print("started $url");
                  setState(() {
                    this.url = url;
                  });
                },
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Icon(Icons.arrow_back),
                  onPressed: () {
                    if (webView != null) {
                      webView.goBack();
                    }
                  },
                ),
                RaisedButton(
                  child: Icon(Icons.arrow_forward),
                  onPressed: () {
                    if (webView != null) {
                      webView.goForward();
                    }
                  },
                ),
                RaisedButton(
                  child: Icon(Icons.refresh),
                  onPressed: () {
                    if (webView != null) {
                      webView.reload();
                    }
                  },
                ),
              ],
            ),
          ].where((Object o) => o != null).toList(),
        ),
      ),
    );
  }
}
