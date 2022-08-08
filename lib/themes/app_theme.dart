import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/app_theme_provider.dart';
import 'package:flutter_boilerplate/themes/flavors/app_theme_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppThemeWidget extends StatelessWidget {
  final Widget child;

  const AppThemeWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final currentThemeFlavor = ref.watch(AppTheme.provider).themeFlavor;
        return Theme(
          data: AppThemeFlavor.fromFlavor(currentThemeFlavor)
              .theme, //     <-----     Theme
          child: child,
        );
      },
    );
  }
}
