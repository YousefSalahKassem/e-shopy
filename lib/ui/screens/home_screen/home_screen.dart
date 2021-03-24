import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_boilerplate/helpers/ui/ui_helpers.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            tr(LocaleKeys.greeting)), //* <-- Generated LocaleKeys usage example
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.homeScreenBody,
              style: context.textTheme.headline5,
            ).tr(),
            UiHelper.verticalSpaceMedium(),
            MaterialButton(
                onPressed: () {
                  final currentLangCode = context.locale.languageCode;
                  currentLangCode == 'en'
                      ? context.setLocale(const Locale('ar'))
                      : context.setLocale(const Locale('en'));
                },
                color: Colors.cyan,
                child: const Text(
                  LocaleKeys.homeScreenToggleLanguage,
                  style: TextStyle(color: Colors.white),
                ).tr())
          ],
        ),
      ),
    );
  }
}
