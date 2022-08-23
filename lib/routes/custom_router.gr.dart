// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../ui/screens/home_screen/boarding_screen.dart' as _i2;
import '../ui/screens/home_screen/forgot_screen.dart' as _i5;
import '../ui/screens/home_screen/login_screen.dart' as _i3;
import '../ui/screens/home_screen/register_screen.dart' as _i4;
import '../ui/screens/home_screen/splash_screen.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    BoardingRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.BoardingScreen());
    },
    LoginRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginScreen());
    },
    RegisterRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.RegisterScreen());
    },
    ForgotRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ForgotScreen());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(SplashRoute.name, path: '/'),
        _i6.RouteConfig(BoardingRoute.name, path: '/boarding-screen'),
        _i6.RouteConfig(LoginRoute.name, path: '/login-screen'),
        _i6.RouteConfig(RegisterRoute.name, path: '/register-screen'),
        _i6.RouteConfig(ForgotRoute.name, path: '/forgot-screen')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.BoardingScreen]
class BoardingRoute extends _i6.PageRouteInfo<void> {
  const BoardingRoute() : super(BoardingRoute.name, path: '/boarding-screen');

  static const String name = 'BoardingRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-screen');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.RegisterScreen]
class RegisterRoute extends _i6.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-screen');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i5.ForgotScreen]
class ForgotRoute extends _i6.PageRouteInfo<void> {
  const ForgotRoute() : super(ForgotRoute.name, path: '/forgot-screen');

  static const String name = 'ForgotRoute';
}
