import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider_boilerplate/helpers/ui/ui_helpers.dart';
import 'package:upgrader/upgrader.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr("greeting")),
        centerTitle: true,
      ),
      body: UpgradeAlert(
        showIgnore: false,
        showLater: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'home_screen.body',
                style: context.textTheme.headline5,
              ).tr(),
              UiHelper.verticalSpaceMedium(),
              RaisedButton(
                  onPressed: () {
                    final currentLangCode = context.locale.languageCode;
                    currentLangCode == 'en'
                        ? context.locale = const Locale('ar')
                        : context.locale = const Locale('en');
                  },
                  color: Colors.cyan,
                  child: const Text(
                    'home_screen.toggle_language',
                    style: TextStyle(color: Colors.white),
                  ).tr())
            ],
          ),
        ),
      ),
    );
  }
}
