// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i18;
import 'package:flutter/material.dart' as _i19;

import '../blocs/model/product_model.dart' as _i20;
import '../ui/screens/Address/add_address_screen.dart' as _i14;
import '../ui/screens/Address/address_screen.dart' as _i13;
import '../ui/screens/Authentication/boarding_screen.dart' as _i2;
import '../ui/screens/Authentication/forgot_screen.dart' as _i5;
import '../ui/screens/Authentication/login_screen.dart' as _i3;
import '../ui/screens/Authentication/register_screen.dart' as _i4;
import '../ui/screens/Authentication/splash_screen.dart' as _i1;
import '../ui/screens/Landing/cart_screen.dart' as _i10;
import '../ui/screens/Landing/category_screen.dart' as _i16;
import '../ui/screens/Landing/favourite_screen.dart' as _i7;
import '../ui/screens/Landing/Home/details_screen.dart' as _i17;
import '../ui/screens/Landing/Home/home_screen.dart' as _i6;
import '../ui/screens/Landing/landing_screen.dart' as _i9;
import '../ui/screens/Landing/profile_screen.dart' as _i8;
import '../ui/screens/Settings/edit_profile_screen.dart' as _i11;
import '../ui/screens/Settings/help_center.dart' as _i12;
import '../ui/screens/Settings/settings_screen.dart' as _i15;

class AppRouter extends _i18.RootStackRouter {
  AppRouter([_i19.GlobalKey<_i19.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    BoardingRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.BoardingScreen());
    },
    LoginRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginScreen());
    },
    RegisterRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.RegisterScreen());
    },
    ForgotRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ForgotScreen());
    },
    HomeRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.HomeScreen());
    },
    FavouriteRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.FavouriteScreen());
    },
    ProfileRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ProfileScreen());
    },
    LandingRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.LandingScreen());
    },
    CartRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.CartScreen());
    },
    EditProfileRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.EditProfileScreen());
    },
    HelpCenter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.HelpCenter());
    },
    AddressRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.AddressScreen());
    },
    AddAddressRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.AddAddressScreen());
    },
    SettingsRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.SettingsScreen());
    },
    CategoryRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i16.CategoryScreen(key: args.key, category: args.category));
    },
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i17.DetailsScreen(key: args.key, product: args.product));
    }
  };

  @override
  List<_i18.RouteConfig> get routes => [
        _i18.RouteConfig(SplashRoute.name, path: '/'),
        _i18.RouteConfig(BoardingRoute.name, path: '/boarding-screen'),
        _i18.RouteConfig(LoginRoute.name, path: '/login-screen'),
        _i18.RouteConfig(RegisterRoute.name, path: '/register-screen'),
        _i18.RouteConfig(ForgotRoute.name, path: '/forgot-screen'),
        _i18.RouteConfig(HomeRoute.name, path: '/home-screen'),
        _i18.RouteConfig(FavouriteRoute.name, path: '/favourite-screen'),
        _i18.RouteConfig(ProfileRoute.name, path: '/profile-screen'),
        _i18.RouteConfig(LandingRoute.name, path: '/landing-screen'),
        _i18.RouteConfig(CartRoute.name, path: '/cart-screen'),
        _i18.RouteConfig(EditProfileRoute.name, path: '/edit-profile-screen'),
        _i18.RouteConfig(HelpCenter.name, path: '/help-center'),
        _i18.RouteConfig(AddressRoute.name, path: '/address-screen'),
        _i18.RouteConfig(AddAddressRoute.name, path: '/add-address-screen'),
        _i18.RouteConfig(SettingsRoute.name, path: '/settings-screen'),
        _i18.RouteConfig(CategoryRoute.name, path: '/category-screen'),
        _i18.RouteConfig(DetailsRoute.name, path: '/details-screen')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i18.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.BoardingScreen]
class BoardingRoute extends _i18.PageRouteInfo<void> {
  const BoardingRoute() : super(BoardingRoute.name, path: '/boarding-screen');

  static const String name = 'BoardingRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i18.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-screen');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.RegisterScreen]
class RegisterRoute extends _i18.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-screen');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i5.ForgotScreen]
class ForgotRoute extends _i18.PageRouteInfo<void> {
  const ForgotRoute() : super(ForgotRoute.name, path: '/forgot-screen');

  static const String name = 'ForgotRoute';
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i18.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-screen');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.FavouriteScreen]
class FavouriteRoute extends _i18.PageRouteInfo<void> {
  const FavouriteRoute()
      : super(FavouriteRoute.name, path: '/favourite-screen');

  static const String name = 'FavouriteRoute';
}

/// generated route for
/// [_i8.ProfileScreen]
class ProfileRoute extends _i18.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '/profile-screen');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i9.LandingScreen]
class LandingRoute extends _i18.PageRouteInfo<void> {
  const LandingRoute() : super(LandingRoute.name, path: '/landing-screen');

  static const String name = 'LandingRoute';
}

/// generated route for
/// [_i10.CartScreen]
class CartRoute extends _i18.PageRouteInfo<void> {
  const CartRoute() : super(CartRoute.name, path: '/cart-screen');

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i11.EditProfileScreen]
class EditProfileRoute extends _i18.PageRouteInfo<void> {
  const EditProfileRoute()
      : super(EditProfileRoute.name, path: '/edit-profile-screen');

  static const String name = 'EditProfileRoute';
}

/// generated route for
/// [_i12.HelpCenter]
class HelpCenter extends _i18.PageRouteInfo<void> {
  const HelpCenter() : super(HelpCenter.name, path: '/help-center');

  static const String name = 'HelpCenter';
}

/// generated route for
/// [_i13.AddressScreen]
class AddressRoute extends _i18.PageRouteInfo<void> {
  const AddressRoute() : super(AddressRoute.name, path: '/address-screen');

  static const String name = 'AddressRoute';
}

/// generated route for
/// [_i14.AddAddressScreen]
class AddAddressRoute extends _i18.PageRouteInfo<void> {
  const AddAddressRoute()
      : super(AddAddressRoute.name, path: '/add-address-screen');

  static const String name = 'AddAddressRoute';
}

/// generated route for
/// [_i15.SettingsScreen]
class SettingsRoute extends _i18.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings-screen');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i16.CategoryScreen]
class CategoryRoute extends _i18.PageRouteInfo<CategoryRouteArgs> {
  CategoryRoute({_i19.Key? key, required String category})
      : super(CategoryRoute.name,
            path: '/category-screen',
            args: CategoryRouteArgs(key: key, category: category));

  static const String name = 'CategoryRoute';
}

class CategoryRouteArgs {
  const CategoryRouteArgs({this.key, required this.category});

  final _i19.Key? key;

  final String category;

  @override
  String toString() {
    return 'CategoryRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i17.DetailsScreen]
class DetailsRoute extends _i18.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({_i19.Key? key, required _i20.Product product})
      : super(DetailsRoute.name,
            path: '/details-screen',
            args: DetailsRouteArgs(key: key, product: product));

  static const String name = 'DetailsRoute';
}

class DetailsRouteArgs {
  const DetailsRouteArgs({this.key, required this.product});

  final _i19.Key? key;

  final _i20.Product product;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, product: $product}';
  }
}
