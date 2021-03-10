import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/ui/screens/home_screen/home_screen.dart';
import 'package:flutter_boilerplate/ui/screens/language_selection_screen.dart';
import 'package:flutter_boilerplate/ui/screens/splash_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String homeScreen = '/home-screen';
  static const String languageSelectionScreen = '/language-selection-screen';
  static const all = <String>{
    splashScreen,
    homeScreen,
    languageSelectionScreen,
  };
}

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.languageSelectionScreen:
        return MaterialPageRoute(builder: (_) => LanguageSelectionScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
