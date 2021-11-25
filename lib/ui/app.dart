import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/events/ui/ui_event_bus_ovelay.dart';
import 'package:flutter_boilerplate/blocs/events/ui/ui_events_bus.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';
import 'package:flutter_boilerplate/helpers/ui/ui_helpers.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_boilerplate/themes/app_theme.dart';
import 'package:overlay_support/overlay_support.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // App Localization
    return OverlaySupport(
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: UiEventBusOverlay(
          onListen: (UiEventBus event) {
            // set action based on what is event .. you can add more events in ui_event_bus.dart file
            if (event is DioErrorEvent) {
              UiHelpers.showNotification(event.message);
            } else if (event is UserLoggedEvent) {
              UiHelpers.showNotification(LocaleKeys.alerts_success_login.tr());
            }
          },
          child: Builder(
            builder: (context) => MaterialApp.router(
              title: "Kortobaa 's Boilerplate",
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              routerDelegate: AutoRouterDelegate(_appRouter),
              routeInformationParser: _appRouter.defaultRouteParser(),
              builder: (context, child) => AppTheme(navigator: child),
            ),
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
