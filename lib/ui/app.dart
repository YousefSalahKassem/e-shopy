import 'package:flutter/material.dart';

import 'package:overlay_support/overlay_support.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/localization_provider.dart';
import 'package:flutter_translate/localized_app.dart';
import 'package:provider_boilerplate/helpers/ui/ui_helpers.dart';
import 'package:provider_boilerplate/routes/custom_router.dart';
import 'package:provider_boilerplate/themes/app_theme.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // App Localization
    final localizationDelegate = LocalizedApp.of(context).delegate;
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: OverlaySupport(
        child: MaterialApp(
          title: "Kortobaa 's Boilerplate",

          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            localizationDelegate
          ],
          supportedLocales: localizationDelegate.supportedLocales,
          locale: localizationDelegate.currentLocale,

          // ! Remove This Part if You Don't Want To Apply Responsiveness to TextStyles
          //* We use this approach to apply UiHelper responsive methods
          // on text styles file
          // first we get a context that has MediaQuery data in it
          // using the 'builder' property in Material App
          // then we update the dimensions in UiHelper and after that we use
          // our completly responsive text sizes / theme normally
          builder: (context, navigator) {
            // Update Screen Dimensions
            UiHelper.updateScreenDimensions(context);

            return AppTheme(navigator: navigator);
          },
          // ! Remove This Part if You Don't Want To Apply Responsiveness to TextStyles

          onGenerateRoute: CustomRouter.generateRoute,
          initialRoute: Routes.splashScreen,
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
