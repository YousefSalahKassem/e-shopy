import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).greeting),
        centerTitle: true,
      ),
      body: UpgradeAlert(
          showIgnore: false,
          showLater: false,
          child: const Center(child: Text('Home screen'))),
    );
  }
}
