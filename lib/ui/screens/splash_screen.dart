import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'package:provider_boilerplate/helpers/shared_preferences_keys.dart';
import 'package:provider_boilerplate/routes/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getString(savedLocaleKey) != null) {
        ExtendedNavigator.root.replace(Routes.homeScreen);
      } else {
        changeLocale(context, 'ar');
        ExtendedNavigator.root.replace(Routes.languageSelectionScreen);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Image.asset(
            'assets/images/kortobaa.png',
            width: 90,
            height: 180,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
