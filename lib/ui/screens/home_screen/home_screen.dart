import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';
import 'package:flutter_boilerplate/helpers/ui/extensions.dart';
import 'package:flutter_boilerplate/themes/dimensions.dart';
import 'package:flutter_boilerplate/ui/widgets/custom_appbar.dart';
import 'package:upgrader/upgrader.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.greeting.tr(),
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
              const SizedBox(height: kSpaceMedium),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.cyan),
                onPressed: () {
                  final currentLangCode = context.locale.languageCode;
                  currentLangCode == 'en'
                      ? context.setLocale(const Locale('ar'))
                      : context.setLocale(const Locale('en'));
                },
                child: Text(
                  tr(
                    LocaleKeys.home_screen_toggle_language,
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
