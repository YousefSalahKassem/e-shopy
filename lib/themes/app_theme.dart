import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/helpers/ui/enums.dart';
import 'package:flutter_boilerplate/themes/app_theme_provider.dart';
import 'package:flutter_boilerplate/themes/flavors/app_theme_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ## wrapper for a widget (or the app) to apply the theme flavor on it.
///
/// [AppThemeWidget] use [Consumer] widget to watch any changes in the provider
/// of [AppTheme] and get current [ThemeFlavor] from [AppTheme] provider,
///
/// take the [ThemeData] for the selected flavor from [AppThemeFlavor] factory
/// by passing the [ThemeFlavor] and apply [ThemeData] to the [child],
///
/// ### see  [AppThemeFlavor] to add your custom flavor
class AppThemeWidget extends StatelessWidget {
  final Widget child;

  const AppThemeWidget({Key? key, required this.child}) : super(key: key);

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
