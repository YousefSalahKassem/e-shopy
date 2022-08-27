import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/interface/i_auth_state.dart';
import 'package:flutter_boilerplate/blocs/model/user.dart';
import 'package:flutter_boilerplate/blocs/providers/auth_provider.dart';
import 'package:flutter_boilerplate/blocs/providers/user_provider.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_boilerplate/themes/flavor/light/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    ref.read(UserProvider.provider.notifier).getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: context.heightR(.04)),
          Consumer(
            builder: (_, ref, __) {
              final state = ref.watch(UserProvider.provider);
              if (state is AuthProviderLoaded) {
                return Header(user: state.user);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          SizedBox(height: context.heightR(.02)),
          ProfileMenu(
            text: LocaleKeys.myAccount.tr(),
            icon: "assets/icons/User Icon.svg",
            press: () => AutoRouter.of(context).push(const EditProfileRoute()),
          ),
          ProfileMenu(
            text: LocaleKeys.Addresses.tr(),
            icon: "assets/icons/Location point.svg",
            press: () => AutoRouter.of(context).push(const AddressRoute()),
          ),
          ProfileMenu(
            text: LocaleKeys.settings.tr(),
            icon: "assets/icons/Settings.svg",
            press: () => AutoRouter.of(context).push(const SettingsRoute()),
          ),
          ProfileMenu(
            text: LocaleKeys.help.tr(),
            icon: "assets/icons/Question mark.svg",
            press: () => AutoRouter.of(context).push(const HelpCenter()),
          ),
          ProfileMenu(
            text: LocaleKeys.logout.tr(),
            icon: "assets/icons/Log out.svg",
            press: () =>  ref.read(AuthProvider.provider.notifier).logout(context),
          ),
        ],
      ),
    );
  }
}

class Header extends ConsumerWidget {
  final User user;

  const Header({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: const Color(0xFFFFECDF),
          child: Icon(
            Icons.person_rounded,
            color: Colors.grey.shade400,
            size: 50,
          ),
        ),
        Text(
          user.name,
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          user.email,
          style: Theme.of(context).textTheme.headline5,
        ),
      ],
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.text,
    required this.icon,
    this.press,
  });

  final String text;
  final String icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: DecoratedBox(
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
        child: TextButton(
          style: TextButton.styleFrom(
            primary: kPrimaryColor,
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Theme.of(context).cardColor,
          ),
          onPressed: press,
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                color: kPrimaryColor,
                width: 22,
              ),
              const SizedBox(width: 20),
              Expanded(child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
