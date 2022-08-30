import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/data/remote/constants/app_endpoints.dart';
import 'package:flutter_boilerplate/data/token_holder.dart';
import 'package:flutter_boilerplate/generated/codegen_loader.g.dart';
import 'package:flutter_boilerplate/helpers/locale.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_boilerplate/themes/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart' as core;
import 'package:overlay_support/overlay_support.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    ProviderScope(
      overrides: [
        core.EndPoints.provider.overrideWithValue(AppEndPoint()),
        core.ITokenHolder.provider.overrideWithProvider(TokenHolder.provider),
      ],
      child: EasyLocalization(
        supportedLocales: const [AppLocale.arabic, AppLocale.english],
        path: 'assets/translations',
        assetLoader: const CodegenLoader(),
        fallbackLocale: AppLocale.english,
        useOnlyLangCode: true,
        child: const MyApp(),
      ),
    ),
  );
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRoute = AppRouter();

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp.router(
        title: 'Flutter Demo',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        routerDelegate: AutoRouterDelegate(_appRoute),
        routeInformationParser: _appRoute.defaultRouteParser(),
        builder: (context, child) => AppThemeWidget(
          child: SizedBox(
            child: child,
          ),
        ),
      ),
    );
  }
}
