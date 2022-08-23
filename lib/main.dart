import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_boilerplate/themes/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  static final appRoute = AppRouter();

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routerDelegate: AutoRouterDelegate(appRoute),
      routeInformationParser: appRoute.defaultRouteParser(),
      builder: (context,child)=>AppThemeWidget(
        child: SizedBox(child: child,),
      ),
    );
  }
}
