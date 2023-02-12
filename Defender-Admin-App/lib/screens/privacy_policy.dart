import 'dart:async';
import 'dart:io';
import 'package:defender_admin/screens/settings.dart';
import 'package:defender_admin/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicy extends StatefulWidget {
  static const screenID = 'Privacy Policy';
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    FlutterStatusbarcolor.setStatusBarColor(Colors.black);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white12,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                SettingsScreen.screenID,
              );
            },
            icon: Icon(
              FontAwesomeIcons.chevronLeft,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Privacy Policy",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: WebView(
          initialUrl: "https://www.jaytillu.com/post/privacypolicy",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController _webViewController) {
            _completer.complete(_webViewController);
          },
        ),
      ),
    );
  }
}
