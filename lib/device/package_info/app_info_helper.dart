import 'dart:io';

import 'package:flutter_boilerplate/device/package_info/share_endpoints.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';

class AppInfoHelper {
  static String version = '';
  static String packageName = '';

  factory AppInfoHelper() {
    return _inst;
  }

  static final AppInfoHelper _inst = AppInfoHelper._internal();

  AppInfoHelper._internal();

  static Future<void> getAppInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    packageName = packageInfo.packageName;
    version = packageInfo.version;
  }

  static void share() {
    if (Platform.isAndroid) {
      Share.share(
        kGooglePlayShareUrl(packageName),
      );
    } else if (Platform.isIOS) {
      /// share app for ios
      Share.share(
        kAppleShareUrl(
          packageName,
        ),
      );
    }
  }
}
