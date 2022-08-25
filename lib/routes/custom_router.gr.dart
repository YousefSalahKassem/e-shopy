// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

import '../ui/screens/Authentication/boarding_screen.dart' as _i2;
import '../ui/screens/Authentication/forgot_screen.dart' as _i5;
import '../ui/screens/Authentication/login_screen.dart' as _i3;
import '../ui/screens/Authentication/register_screen.dart' as _i4;
import '../ui/screens/Authentication/splash_screen.dart' as _i1;
import '../ui/screens/Landing/cart_screen.dart' as _i10;
import '../ui/screens/Landing/favourite_screen.dart' as _i7;
import '../ui/screens/Landing/home_screen.dart' as _i6;
import '../ui/screens/Landing/landing_screen.dart' as _i9;
import '../ui/screens/Landing/profile_screen.dart' as _i8;
import '../ui/screens/Settings/edit_profile_screen.dart' as _i11;
import '../ui/screens/Settings/help_center.dart' as _i12;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    BoardingRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.BoardingScreen());
    },
    LoginRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginScreen());
    },
    RegisterRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.RegisterScreen());
    },
    ForgotRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ForgotScreen());
    },
    HomeRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.HomeScreen());
    },
    FavouriteRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.FavouriteScreen());
    },
    ProfileRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ProfileScreen());
    },
    LandingRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.LandingScreen());
    },
    CartRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.CartScreen());
    },
    EditProfileRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.EditProfileScreen());
    },
    HelpCenter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.HelpCenter());
    }
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(SplashRoute.name, path: '/'),
        _i13.RouteConfig(BoardingRoute.name, path: '/boarding-screen'),
        _i13.RouteConfig(LoginRoute.name, path: '/login-screen'),
        _i13.RouteConfig(RegisterRoute.name, path: '/register-screen'),
        _i13.RouteConfig(ForgotRoute.name, path: '/forgot-screen'),
        _i13.RouteConfig(HomeRoute.name, path: '/home-screen'),
        _i13.RouteConfig(FavouriteRoute.name, path: '/favourite-screen'),
        _i13.RouteConfig(ProfileRoute.name, path: '/profile-screen'),
        _i13.RouteConfig(LandingRoute.name, path: '/landing-screen'),
        _i13.RouteConfig(CartRoute.name, path: '/cart-screen'),
        _i13.RouteConfig(EditProfileRoute.name, path: '/edit-profile-screen'),
        _i13.RouteConfig(HelpCenter.name, path: '/help-center')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.BoardingScreen]
class BoardingRoute extends _i13.PageRouteInfo<void> {
  const BoardingRoute() : super(BoardingRoute.name, path: '/boarding-screen');

  static const String name = 'BoardingRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-screen');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.RegisterScreen]
class RegisterRoute extends _i13.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-screen');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i5.ForgotScreen]
class ForgotRoute extends _i13.PageRouteInfo<void> {
  const ForgotRoute() : super(ForgotRoute.name, path: '/forgot-screen');

  static const String name = 'ForgotRoute';
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-screen');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.FavouriteScreen]
class FavouriteRoute extends _i13.PageRouteInfo<void> {
  const FavouriteRoute()
      : super(FavouriteRoute.name, path: '/favourite-screen');

  static const String name = 'FavouriteRoute';
}

/// generated route for
/// [_i8.ProfileScreen]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '/profile-screen');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i9.LandingScreen]
class LandingRoute extends _i13.PageRouteInfo<void> {
  const LandingRoute() : super(LandingRoute.name, path: '/landing-screen');

  static const String name = 'LandingRoute';
}

/// generated route for
/// [_i10.CartScreen]
class CartRoute extends _i13.PageRouteInfo<void> {
  const CartRoute() : super(CartRoute.name, path: '/cart-screen');

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i11.EditProfileScreen]
class EditProfileRoute extends _i13.PageRouteInfo<void> {
  const EditProfileRoute()
      : super(EditProfileRoute.name, path: '/edit-profile-screen');

  static const String name = 'EditProfileRoute';
}

/// generated route for
/// [_i12.HelpCenter]
class HelpCenter extends _i13.PageRouteInfo<void> {
  const HelpCenter() : super(HelpCenter.name, path: '/help-center');

  static const String name = 'HelpCenter';
}
