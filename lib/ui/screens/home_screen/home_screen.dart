import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
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
          child: const Text('home_screen.body').tr(),
        ),
      ),
    );
  }
}
