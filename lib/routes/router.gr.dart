// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/screens/home_screen/home_screen.dart';
import '../ui/screens/language_selection_screen.dart';
import '../ui/screens/splash_screen.dart';

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

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.homeScreen, page: HomeScreen),
    RouteDef(Routes.languageSelectionScreen, page: LanguageSelectionScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashScreen(),
        settings: data,
      );
    },
    HomeScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeScreen(),
        settings: data,
      );
    },
    LanguageSelectionScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LanguageSelectionScreen(),
        settings: data,
      );
    },
  };
}
