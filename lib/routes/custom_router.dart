import 'package:auto_route/auto_route.dart';
import 'package:flutter_boilerplate/ui/screens/Address/add_address_screen.dart';
import 'package:flutter_boilerplate/ui/screens/Address/address_screen.dart';

import 'package:flutter_boilerplate/ui/screens/Authentication/boarding_screen.dart';
import 'package:flutter_boilerplate/ui/screens/Authentication/forgot_screen.dart';
import 'package:flutter_boilerplate/ui/screens/Authentication/login_screen.dart';
import 'package:flutter_boilerplate/ui/screens/Authentication/register_screen.dart';
import 'package:flutter_boilerplate/ui/screens/Authentication/splash_screen.dart';
import 'package:flutter_boilerplate/ui/screens/Landing/Home/details_screen.dart';

import 'package:flutter_boilerplate/ui/screens/Landing/cart_screen.dart';
import 'package:flutter_boilerplate/ui/screens/Landing/category_screen.dart';
import 'package:flutter_boilerplate/ui/screens/Landing/favourite_screen.dart';
import 'package:flutter_boilerplate/ui/screens/Landing/Home/home_screen.dart';
import 'package:flutter_boilerplate/ui/screens/Landing/landing_screen.dart';
import 'package:flutter_boilerplate/ui/screens/Landing/profile_screen.dart';
import 'package:flutter_boilerplate/ui/screens/Settings/edit_profile_screen.dart';
import 'package:flutter_boilerplate/ui/screens/Settings/help_center.dart';
import 'package:flutter_boilerplate/ui/screens/Settings/settings_screen.dart';




@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: BoardingScreen),
    AutoRoute(page: LoginScreen),
    AutoRoute(page: RegisterScreen),
    AutoRoute(page: ForgotScreen),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: FavouriteScreen),
    AutoRoute(page: ProfileScreen),
    AutoRoute(page: LandingScreen),
    AutoRoute(page: CartScreen),
    AutoRoute(page: EditProfileScreen),
    AutoRoute(page: HelpCenter),
    AutoRoute(page: AddressScreen),
    AutoRoute(page: AddAddressScreen),
    AutoRoute(page: SettingsScreen),
    AutoRoute(page: CategoryScreen),
    AutoRoute(page: DetailsScreen),
  ],
)
class $AppRouter {}
