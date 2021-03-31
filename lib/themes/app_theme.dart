import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_boilerplate/services/providers/app_theme_provider.dart';
import 'package:flutter_boilerplate/themes/themes.dart';

class AppTheme extends StatelessWidget {
  final Widget? navigator;

  const AppTheme({Key? key, required this.navigator}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, watch, __) {
      final currentThemeFlavor = watch(appThemeProvider).themeFlavor;
      return Theme(
        data: getThemeData(currentThemeFlavor), //     <-----     Theme
        child: navigator!,
      );
    });
  }
}
