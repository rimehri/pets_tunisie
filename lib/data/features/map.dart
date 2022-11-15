import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';




class ServiceLauncher{

  static Future<void> handleButton(url) async {
    try {
      await launch(url,
          // enableJavaScript: true,
          // forceWebView: true,
          customTabsOption: CustomTabsOption(
            toolbarColor: Color.fromRGBO(173, 40, 93, 1.0),
            enableDefaultShare: true,
            enableUrlBarHiding: true,
            showPageTitle: true,
            animation: CustomTabsSystemAnimation.slideIn(),
            extraCustomTabs: const <String>[
              // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
              'org.mozilla.firefox',
              // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
              'com.microsoft.emmx',
            ],
          ));
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
    // : throw 'Could not launch $_url';
  }

}