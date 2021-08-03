import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_boilerplate/helpers/ui/ui_helpers.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';
import 'package:upgrader/upgrader.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            tr(LocaleKeys.greeting)), //* <-- Generated LocaleKeys usage example
        centerTitle: true,
      ),
      body: UpgradeAlert(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.home_screen_body,
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
                    LocaleKeys.home_screen_toggle_language,
                    style: TextStyle(color: Colors.white),
                  ).tr())
            ],
          ),
        ),
      ),
    );
  }
}
