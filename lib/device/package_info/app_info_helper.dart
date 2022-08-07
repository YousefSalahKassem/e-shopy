import 'dart:io';

import 'package:flutter_boilerplate/device/package_info/share_endpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';

class AppInfoHelper {
  static String _version = '';
  static String _packageName = '';

  String get version => _version;

  String get packageName => _packageName;

  AppInfoHelper._();

  static late final provider = Provider((ref) => AppInfoHelper._());

  static Future<void> ensureInitialized() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _packageName = packageInfo.packageName;
    _version = packageInfo.version;
  }

  /// Share the app url on GooglePlay/AppStore
  void share() {
    if (Platform.isAndroid) {
      // share app for android
      Share.share(
        kGooglePlayShareUrl(_packageName),
      );
    } else if (Platform.isIOS) {
      // share app for ios
      Share.share(
        kAppleShareUrl(
          _packageName,
        ),
      );
    }
  }
}
