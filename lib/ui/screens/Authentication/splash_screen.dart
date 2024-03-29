import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_boilerplate/blocs/providers/user_provider.dart';
import 'package:flutter_boilerplate/helpers/storage_keys.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(UserProvider.provider.notifier).isTokenValid();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Timer(const Duration(seconds: 3), () async {
        if (await ref.read(SimpleLocalData.provider).readBool(checkFirstTime) == null) {
          AutoRouter.of(context).replace(const BoardingRoute());
          await ref.read(SimpleLocalData.provider).writeBool(checkFirstTime, false);
        } else if (ref.watch(UserProvider.provider.notifier).checkAuthToken) {
          AutoRouter.of(context).replace(const LandingRoute());
        } else {
          AutoRouter.of(context).replace(const LoginRoute());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ColoredBox(
        color: const Color(0xFFFF7643),
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: 180,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
