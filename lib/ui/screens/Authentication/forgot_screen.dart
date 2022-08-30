import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/providers/edit_provider.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';
import 'package:flutter_boilerplate/helpers/remote_util.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_boilerplate/ui/widgets/default_button.dart';
import 'package:flutter_boilerplate/ui/widgets/default_text_field.dart';
import 'package:flutter_boilerplate/ui/widgets/no_account_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.heightR(0.02)),
        child: Column(
          children: [
            SizedBox(height: context.heightR(0.2)),
            Text(
              LocaleKeys.forgotPassword.tr(),
              style: TextStyle(
                fontSize: context.heightR(0.03),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              LocaleKeys.forgotPasswordDescription.tr(),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: context.heightR(0.1)),
            const _ForgotPassword(),
          ],
        ),
      ),
    );
  }
}

class _ForgotPassword extends ConsumerWidget {
  const _ForgotPassword();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(EditProvider.provider.notifier);
    final reader = ref.read(RemoteUtil.provider);
    return Form(
      key: reader.registerKey,
      child: Column(
        children: [
          TextFieldApp(
            label: LocaleKeys.email.tr(),
            hint: LocaleKeys.enterEmail.tr(),
            valid: LocaleKeys.emailRequired.tr(),
            controller: reader.emailController,
            icon: Icons.email_outlined,
            type: TextInputType.emailAddress,
          ),
          SizedBox(height: context.heightR(0.03)),
          SizedBox(height: context.heightR(0.1)),
          DefaultButton(
            text: LocaleKeys.resetPassword.tr(),
            press: () {
              if (reader.registerKey.currentState!.validate()) {
                FocusScope.of(context).unfocus();
                notifier.resetPassword().whenComplete(() => AutoRouter.of(context).replace(const LoginRoute()));
              }
            },
          ),
          SizedBox(height: context.heightR(0.01)),
          NoAccountText(
            onPressed: () {
              AutoRouter.of(context).push(const RegisterRoute());
            },
          ),
        ],
      ),
    );  }
}
