import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter_boilerplate/routes/custom_router.dart';
import 'package:flutter_boilerplate/helpers/ui/ui_helpers.dart';
import 'package:flutter_boilerplate/services/providers/shared_preferences_provider.dart';
import 'package:flutter_boilerplate/helpers/storage_keys.dart';

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
              Container(
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
              const SizedBox(
                height: 64,
              ),
              Container(
                width: context.widthR(0.8),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: <Widget>[
                      LanguageButton(
                        locale: context.locale.languageCode,
                        value: 'ar',
                      ),
                      LanguageButton(
                        locale: context.locale.languageCode,
                        value: 'en',
                      ),
                    ],
                  ),
                ),
              ),
              UiHelper.verticalSpaceXLarge(),
              RaisedButton(
                color: Colors.cyan,
                onPressed: () {
                  // Ensure not to show this screen again
                  SharedPreferencesProvider.instance
                      .setBool(kShowLanguageSelectionScreen, false);
                  // Navigate to Home
                  Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
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
    Key key,
    this.locale,
    this.value,
  }) : super(key: key);
  final String locale;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: UiHelper.height(48),
        child: FlatButton(
          onPressed: () {
            context.locale = Locale(value);
          },
          child: Text(
            tr(value),
            style: TextStyle(
              color: locale == value
                  ? Theme.of(context).primaryColor
                  : Colors.black45,
            ),
          ),
        ),
      ),
    );
  }
}
