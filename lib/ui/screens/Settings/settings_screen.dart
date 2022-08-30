import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';
import 'package:flutter_boilerplate/helpers/locale.dart';
import 'package:flutter_boilerplate/helpers/ui/enums.dart';
import 'package:flutter_boilerplate/helpers/ui/ui_helpers.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_boilerplate/themes/app_theme_provider.dart';
import 'package:flutter_boilerplate/themes/flavor/light/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          LocaleKeys.settings.tr(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const _BuildSettings(),
    );
  }
}

class _BuildSettings extends ConsumerWidget {
  const _BuildSettings();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 10,
                spreadRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ListTile(
            title: Text(
              LocaleKeys.switchMode.tr(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.headline6!.color,
              ),
            ),
            leading: const Icon(Icons.star_half_rounded, color: kPrimaryColor),
            trailing: const Icon(Icons.arrow_forward_ios, color: kPrimaryColor),
            onTap: () {
              UiHelpers.showMenuChoices(
                context: context,
                firstTitle: LocaleKeys.Light.tr(),
                secondTitle: LocaleKeys.Dark.tr(),
                firstChoice: () {
                  ref.read(AppTheme.provider).setThemeFlavor(ThemeFlavor.light);
                  AutoRouter.of(context).pop();
                },
                secondChoice: () {
                  ref.read(AppTheme.provider).setThemeFlavor(ThemeFlavor.dark);
                  AutoRouter.of(context).pop();
                },
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 10,
                spreadRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ListTile(
            title: Text(
              LocaleKeys.swtichLanguage.tr(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.headline6!.color,
              ),
            ),
            leading: const Icon(Icons.language, color: kPrimaryColor),
            trailing: const Icon(Icons.arrow_forward_ios, color: kPrimaryColor),
            onTap: () {
              UiHelpers.showMenuChoices(
                context: context,
                firstTitle: 'English',
                secondTitle: 'العربية',
                firstChoice: () {
                  context.setLocale(AppLocale.english);
                  context.popRoute();
                  AutoRouter.of(context).pushAndPopUntil(
                    const LandingRoute(),
                    predicate: (_) => false,
                  );
                },
                secondChoice: () {
                  context.setLocale(AppLocale.arabic);
                  context.popRoute();
                  AutoRouter.of(context).pushAndPopUntil(
                    const LandingRoute(),
                    predicate: (_) => false,
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}
