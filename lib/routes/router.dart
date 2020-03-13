import 'package:auto_route/auto_route_annotations.dart';
import 'package:provider_boilerplate/ui/screens/home_screen/home_screen.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  HomeScreen homeScreen;
}
