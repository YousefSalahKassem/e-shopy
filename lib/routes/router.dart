import 'package:auto_route/auto_route_annotations.dart';
import 'package:provider_boilerplate/ui/screens/home_screen/home_screen.dart';
import 'package:provider_boilerplate/ui/screens/language_selection_screen.dart';
import 'package:provider_boilerplate/ui/screens/splash_screen.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  SplashScreen splashScreen;

  HomeScreen homeScreen;

  LanguageSelectionScreen languageSelectionScreen;
}
