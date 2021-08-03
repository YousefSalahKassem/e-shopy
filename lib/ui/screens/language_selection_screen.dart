import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter_boilerplate/helpers/ui/ui_helpers.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_boilerplate/services/providers/shared_prefs_provider.dart';
import 'package:flutter_boilerplate/helpers/storage_keys.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: context.widthR(0.8),
                height: UiHelper.height(300),
                child: Center(
                  child: Image.asset(
                    'assets/images/kortobaa.png',
                    fit: BoxFit.fitHeight,
                    height: UiHelper.height(180),
                  ),
                ),
              ),
              UiHelper.verticalSpaceXLarge(),
              SizedBox(
                width: context.widthR(0.8),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: <Widget>[
                      LanguageButton(
                        key: const Key('changeAr'),
                        locale: context.locale.languageCode,
                        value: 'ar',
                      ),
                      UiHelper.horizontalSpaceMedium(),
                      LanguageButton(
                        locale: context.locale.languageCode,
                        value: 'en',
                      ),
                    ],
                  ),
                ),
              ),
              UiHelper.verticalSpaceXLarge(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.cyan),
                onPressed: () {
                  // Ensure not to show this screen again
                  context
                      .read(sharedPrefsProvider)!
                      .setBool(kShowLanguageSelectionScreen, false);
                  // Navigate to Home
                  AutoRouter.of(context).replace(const HomeRoute());
                },
                child: Text(tr('start'),
                    style: const TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    Key? key,
    required this.locale,
    required this.value,
  }) : super(key: key);
  final String locale;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: UiHelper.height(48),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.deepOrangeAccent),
          onPressed: () {
            context.setLocale(Locale(value));
          },
          child: Text(
            tr(value),
            style: TextStyle(
              color:
                  locale == value ? context.theme.primaryColor : Colors.black45,
            ),
          ),
        ),
      ),
    );
  }
}
