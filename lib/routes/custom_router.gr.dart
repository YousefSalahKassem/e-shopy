// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as i4;
import 'package:flutter/material.dart' as i5;

import 'package:flutter_boilerplate/ui/screens/home_screen/home_screen.dart' as i2;
import 'package:flutter_boilerplate/ui/screens/language_selection_screen.dart' as i3;
import 'package:flutter_boilerplate/ui/screens/splash_screen.dart' as i1;

class AppRouter extends i4.RootStackRouter {
  AppRouter([i5.GlobalKey<i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, i4.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: i1.SplashScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: i2.HomeScreen(),
      );
    },
    LanguageSelectionRoute.name: (routeData) {
      return i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: i3.LanguageSelectionScreen(),
      );
    }
  };

  @override
  List<i4.RouteConfig> get routes => [
        i4.RouteConfig(SplashRoute.name, path: '/'),
        i4.RouteConfig(HomeRoute.name, path: '/home-screen'),
        i4.RouteConfig(
          LanguageSelectionRoute.name,
          path: '/language-selection-screen',
        )
      ];
}

/// generated route for [i1.SplashScreen]
class SplashRoute extends i4.PageRouteInfo<void> {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for [i2.HomeScreen]
class HomeRoute extends i4.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '/home-screen');

  static const String name = 'HomeRoute';
}

/// generated route for [i3.LanguageSelectionScreen]
class LanguageSelectionRoute extends i4.PageRouteInfo<void> {
  const LanguageSelectionRoute()
      : super(name, path: '/language-selection-screen');

  static const String name = 'LanguageSelectionRoute';
}
