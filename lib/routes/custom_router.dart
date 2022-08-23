import 'package:auto_route/auto_route.dart';


import '../ui/screens/home_screen/boarding_screen.dart';
import '../ui/screens/home_screen/forgot_screen.dart';
import '../ui/screens/home_screen/login_screen.dart';
import '../ui/screens/home_screen/register_screen.dart';
import '../ui/screens/home_screen/splash_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: BoardingScreen),
    AutoRoute(page: LoginScreen),
    AutoRoute(page: RegisterScreen),
    AutoRoute(page: ForgotScreen)
  ],
)
class $AppRouter {}