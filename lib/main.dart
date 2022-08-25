import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/data/remote/constants/endpoints.dart';
import 'package:flutter_boilerplate/data/token_holder.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_boilerplate/themes/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart' as core;
import 'package:overlay_support/overlay_support.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      overrides: [
        core.EndPoints.provider.overrideWithValue(EndPoint()),
        core.ITokenHolder.provider.overrideWithProvider(TokenHolder.provider),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  static final appRoute = AppRouter();

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routerDelegate: AutoRouterDelegate(appRoute),
        routeInformationParser: appRoute.defaultRouteParser(),
        builder: (context, child) => AppThemeWidget(
          child: SizedBox(
            child: child,
          ),
        ),
      ),
    );
  }
}
