import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/helpers/ui/enums.dart';
import 'package:flutter_boilerplate/themes/app_theme_provider.dart';
import 'package:flutter_boilerplate/themes/flavor/app_theme_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppThemeWidget extends StatelessWidget {
  final Widget child;

  const AppThemeWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final ThemeFlavor currentThemeFlavor =
            ref.watch(AppTheme.provider).themeFlavor;

        final AppThemeFlavor appThemeFlavor =
            AppThemeFlavor.fromFlavor(currentThemeFlavor);
        return Theme(
          data: appThemeFlavor.theme, //     <-----     Theme
          child: child,
        );
      },
    );
  }
}
