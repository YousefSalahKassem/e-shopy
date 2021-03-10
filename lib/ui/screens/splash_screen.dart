import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/helpers/ui/ui_helpers.dart';
import 'package:flutter_boilerplate/helpers/storage_keys.dart';
import 'package:flutter_boilerplate/routes/custom_router.dart';

import 'package:flutter_boilerplate/services/providers/shared_preferences_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen();

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () async {
      if (SharedPreferencesProvider.instance
              .getBool(kShowLanguageSelectionScreen) !=
          null) {
        Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
      } else {
        Navigator.of(context)
            .pushReplacementNamed(Routes.languageSelectionScreen);
      }
    });
    return SizedBox.expand(
      child: Container(
        color: context.theme.backgroundColor,
        child: Center(
          child: Image.asset(
            'assets/images/kortobaa.png',
            height: 180,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
