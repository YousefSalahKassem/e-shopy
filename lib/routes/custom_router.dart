import 'package:auto_route/auto_route.dart';

import 'package:flutter_boilerplate/ui/screens/home_screen/home_screen.dart';
import 'package:flutter_boilerplate/ui/screens/language_selection_screen.dart';
import 'package:flutter_boilerplate/ui/screens/splash_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: LanguageSelectionScreen)
  ],
)
class $AppRouter {}
