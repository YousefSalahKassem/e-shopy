import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';

import 'package:overlay_support/overlay_support.dart';

import 'package:easy_localization/easy_localization.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // App Localization
    final _appRouter = AppRouter();

    return OverlaySupport(
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: Builder(
          builder: (context) => MaterialApp.router(
            title: "Kortobaa 's Boilerplate",
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,

            // ! Remove This Part if You Don't Want To Apply Responsiveness to TextStyles
            //* We use this approach to apply UiHelper responsive methods
            // on text styles file
            // first we get a context that has MediaQuery data in it
            // using the 'builder' property in Material App
            // then we update the dimensions in UiHelper and after that we use
            // our completly responsive text sizes / theme normally

            // ! Remove This Part if You Don't Want To Apply Responsiveness to TextStyles
            routerDelegate: AutoRouterDelegate(_appRouter),
            routeInformationParser: _appRouter.defaultRouteParser(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // * App Scope Disposer
    // Dispose any opened resources that is scoped to the whole application
    // such as Database Instances, Errors Handlers Streams, etc ...
  }
}
