import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/helpers/locale.dart';
import 'package:flutter_boilerplate/helpers/storage_keys.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_boilerplate/services/providers/shared_prefs_provider.dart';
import 'package:flutter_boilerplate/themes/dimensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class LanguageSelectionScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              const SizedBox(height: spaceXXLarge),
              SizedBox(
                width: context.widthR(0.8),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: const <Widget>[
                      LanguageButton(
                        key: Key('changeAr'),
                        locale: AppLocale.arabic,
                      ),
                      SizedBox(width: spaceLarge),
                      LanguageButton(
                        locale:AppLocale.english,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: spaceXXLarge),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.cyan),
                onPressed: () {
                  // Ensure not to show this screen again
                  ref
                      .read(LocalUserData.provider)
                  //TODO add bool
                      .write(showLanguageSelectionScreen, 'false');
                  // Navigate to Home
                  AutoRouter.of(context).replace(const HomeRoute());
                },
                child: Text(
                  tr('start'),
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

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    Key? key,
    required this.locale,
  }) : super(key: key);
  final Locale locale;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: context.heightR(0.075),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.white),
          onPressed: () {
            context.setLocale(locale);
          },
          child: Text(
            tr(locale.languageCode),
            style: TextStyle(
              color:
                  locale == context.locale ? context.theme.primaryColor : Colors.black45,
            ),
          ),
        ),
      ),
    );
  }
}
