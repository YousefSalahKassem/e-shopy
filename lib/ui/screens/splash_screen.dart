import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:provider_boilerplate/services/providers/localizations_provider.dart';

import 'package:provider_boilerplate/helpers/storage_keys.dart';
import 'package:provider_boilerplate/routes/custom_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen();

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getString(kSavedLocaleKey) != null) {
        Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
      } else {
        context.read(localizationsProvider).changeLocale(kDefaultLocale);
        Navigator.of(context)
            .pushReplacementNamed(Routes.languageSelectionScreen);
      }
    });
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
