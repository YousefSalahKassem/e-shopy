// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../ui/screens/home_screen/home_screen.dart' as _i2;
import '../ui/screens/language_selection_screen.dart' as _i3;
import '../ui/screens/splash_screen.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.SplashScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.HomeScreen(),
      );
    },
    LanguageSelectionRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.LanguageSelectionScreen(),
      );
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SplashRoute.name, path: '/'),
        _i4.RouteConfig(HomeRoute.name, path: '/home-screen'),
        _i4.RouteConfig(
          LanguageSelectionRoute.name,
          path: '/language-selection-screen',
        )
      ];
}

/// generated route for [_i1.SplashScreen]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for [_i2.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '/home-screen');

  static const String name = 'HomeRoute';
}

/// generated route for [_i3.LanguageSelectionScreen]
class LanguageSelectionRoute extends _i4.PageRouteInfo<void> {
  const LanguageSelectionRoute()
      : super(name, path: '/language-selection-screen');

  static const String name = 'LanguageSelectionRoute';
}
