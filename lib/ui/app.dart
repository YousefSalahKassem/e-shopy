import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/events/ui/ui_event_bus_ovelay.dart';
import 'package:flutter_boilerplate/blocs/events/ui/ui_events_bus.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';
import 'package:flutter_boilerplate/helpers/ui/ui_helpers.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_boilerplate/themes/app_theme.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:overlay_support/overlay_support.dart' hide Toast;

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // App Localization
    return OverlaySupport(
      child: UiEventBusOverlay(
        onListen: (UiEventBus event) {
          // set action based on what is event .. you can add more events in ui_event_bus.dart file
          if (event is DioErrorEvent) {
            UiHelpers.showNotification(event.message);
          } else if (event is UserLoggedEvent) {
            UiHelpers.showNotification(LocaleKeys.alerts_success_login.tr());
          } else if (event is InternetConnectionFailedEvent) {
            Fluttertoast.showToast(
              msg: LocaleKeys.alerts_internet_connection_failed.tr(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              fontSize: 16.0,
            );
          }
        },
        child: MaterialApp.router(
          onGenerateTitle: (context) {
            return LocaleKeys.appName.tr();
          },
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routerDelegate: AutoRouterDelegate(_appRouter),
          routeInformationParser: _appRouter.defaultRouteParser(),
          builder: (context, child) => AppTheme(
            child: SizedBox(
              child: child,
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
