import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';
import 'package:flutter_boilerplate/helpers/locale.dart';
import 'package:flutter_boilerplate/helpers/ui/enums.dart';
import 'package:flutter_boilerplate/helpers/ui/extensions.dart';
import 'package:flutter_boilerplate/themes/app_theme_provider.dart';
import 'package:flutter_boilerplate/themes/dimensions.dart';
import 'package:flutter_boilerplate/ui/widgets/custom_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
              const SizedBox(height: spaceMedium),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.cyan),
                onPressed: () {
                  final currentLangCode = context.locale.languageCode;
                  currentLangCode == 'en'
                      ? context.setLocale(AppLocale.arabic)
                      : context.setLocale(AppLocale.english);
                },
                child: Text(
                  tr(
                    LocaleKeys.home_screen_toggle_language,
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Consumer(
                builder: (_, ref, __) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.cyan),
                        onPressed: () {
                          ref
                              .read(AppTheme.provider)
                              .setThemeFlavor(ThemeFlavor.dark);
                        },
                        child: const Text('dark'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.cyan),
                        onPressed: () {
                          ref
                              .read(AppTheme.provider)
                              .setThemeFlavor(ThemeFlavor.light);
                        },
                        child: const Text('light'),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
