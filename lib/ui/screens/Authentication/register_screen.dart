import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/providers/auth_provider.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';
import 'package:flutter_boilerplate/helpers/remote_util.dart';
import 'package:flutter_boilerplate/themes/dimensions.dart';
import 'package:flutter_boilerplate/themes/text_styles.dart';
import 'package:flutter_boilerplate/ui/widgets/default_button.dart';
import 'package:flutter_boilerplate/ui/widgets/default_text_field.dart';
import 'package:flutter_boilerplate/ui/widgets/social_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: spaceLarge),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: context.heightR(.04)), // 4%
                  Text(LocaleKeys.registerAccount.tr(), style: headingStyle),
                  Text(
                    LocaleKeys.registerDescription.tr(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: context.heightR(0.1)),
                  _registerForm(context, ref),
                  SizedBox(height: context.heightR(0.02)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _registerForm(BuildContext context, WidgetRef ref) {
  final notifier = ref.watch(AuthProvider.provider.notifier);
  final reader = ref.read(RemoteUtil.provider);
  return Form(
    key: reader.registerKey,
    child: Column(
      children: [
        TextFieldApp(
          label: LocaleKeys.username.tr(),
          hint: LocaleKeys.enterUsername.tr(),
          controller: reader.nameController,
          icon: Icons.person,
          type: TextInputType.text,
          valid: LocaleKeys.nameRequired.tr(),
        ),
        SizedBox(height: context.heightR(0.03)),
        TextFieldApp(
          label: LocaleKeys.email.tr(),
          hint: LocaleKeys.enterEmail.tr(),
          controller: reader.emailController,
          icon: Icons.email_outlined,
          type: TextInputType.emailAddress,
          valid: LocaleKeys.emailRequired.tr(),
        ),
        SizedBox(height: context.heightR(0.03)),
        TextFieldApp(
          label: LocaleKeys.password.tr(),
          hint: LocaleKeys.enterPassword.tr(),
          controller: reader.passwordController,
          icon: Icons.lock_outline,
          type: TextInputType.text,
          isPassword: true,
          valid: LocaleKeys.passwordRequired.tr(),
        ),
        SizedBox(height: context.heightR(0.03)),
        TextFieldApp(
          label: LocaleKeys.confirmPassword.tr(),
          hint: LocaleKeys.enterPassword.tr(),
          controller: reader.confirmPasswordController,
          icon: Icons.lock_outline,
          type: TextInputType.text,
          isPassword: true,
          valid: LocaleKeys.confirmPasswordRequired.tr(),
        ),
        SizedBox(height: context.heightR(0.04)),
        DefaultButton(
          text: LocaleKeys.signup.tr(),
          press: () {
            if (reader.registerKey.currentState!.validate() &&
                reader.passwordController.text ==
                    reader.confirmPasswordController.text) {
              notifier.register(context);
            }
          },
        ),
      ],
    ),
  );
}
