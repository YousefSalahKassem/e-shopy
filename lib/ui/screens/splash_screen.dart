import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_boilerplate/helpers/storage_keys.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class SplashScreen extends ConsumerStatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Timer(const Duration(seconds: 3), () async {
        if (await ref
                .read(SimpleLocalData.provider)
                .readString(showLanguageSelectionScreen) ==
            null) {
          AutoRouter.of(context).replace(const HomeRoute());
        } else {
          AutoRouter.of(context).replace(const LanguageSelectionRoute());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: context.theme.backgroundColor,
        child: Center(
          child: Image.asset(
            'assets/images/kortobaa.png',
            height: 180,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
