import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider_boilerplate/helpers/localized_upgrader_messages.dart';
import 'package:upgrader/upgrader.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate('greeting')),
        centerTitle: true,
      ),
      body: UpgradeAlert(
          showIgnore: false,
          showLater: false,
          messages: LocalizedMessages(
              code:
                  LocalizedApp.of(context).delegate.currentLocale.languageCode),
          child: const Center(child: Text('Home screen'))),
    );
  }
}
