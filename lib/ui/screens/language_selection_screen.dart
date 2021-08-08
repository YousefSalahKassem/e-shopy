import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_boilerplate/services/providers/shared_prefs_provider.dart';
import 'package:flutter_boilerplate/helpers/storage_keys.dart';
import 'package:flutter_boilerplate/themes/dimensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_boilerplate/helpers/ui/extensions.dart';

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
                height: context.heightR(0.45),
                child: Center(
                  child: Image.asset(
                    'assets/images/kortobaa.png',
                    fit: BoxFit.fitHeight,
                    height: context.heightR(0.25),
                  ),
                ),
              ),
              const SizedBox(height: kSpaceXXLarge),
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
                      const SizedBox(width: kSpaceLarge),
                      LanguageButton(
                        locale: context.locale.languageCode,
                        value: 'en',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: kSpaceXXLarge),
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
        height: context.heightR(0.075),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.white),
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
