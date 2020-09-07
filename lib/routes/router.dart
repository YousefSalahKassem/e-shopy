import 'package:auto_route/auto_route_annotations.dart';
import 'package:provider_boilerplate/ui/screens/home_screen/home_screen.dart';
import 'package:provider_boilerplate/ui/screens/language_selection_screen.dart';
import 'package:provider_boilerplate/ui/screens/splash_screen.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: SplashScreen, initial: true),
  MaterialRoute(page: HomeScreen),
  MaterialRoute(page: LanguageSelectionScreen)
])
class $Router {}
