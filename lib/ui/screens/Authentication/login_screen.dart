import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/providers/auth_provider.dart';
import 'package:flutter_boilerplate/helpers/remote_util.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_boilerplate/themes/text_styles.dart';
import 'package:flutter_boilerplate/ui/widgets/default_button.dart';
import 'package:flutter_boilerplate/ui/widgets/default_text_field.dart';
import 'package:flutter_boilerplate/ui/widgets/no_account_text.dart';
import 'package:flutter_boilerplate/ui/widgets/social_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: context.heightR(0.1),
            ),
            const Text(
              'Welcome Back',
              style: headingStyle,
            ),
            const Text(
              "Sign in with your email and password  \nor continue with social media",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: context.heightR(0.1)),
            _signForm(context, ref),
            SizedBox(height: context.heightR(0.1)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialCard(
                  icon: "assets/icons/google-icon.svg",
                  press: () {},
                ),
                SocialCard(
                  icon: "assets/icons/facebook-2.svg",
                  press: () {},
                ),
                SocialCard(
                  icon: "assets/icons/twitter.svg",
                  press: () {},
                ),
              ],
            ),
            SizedBox(height: context.heightR(0.02)),
            NoAccountText(
              onPressed: () {
                AutoRouter.of(context).push(const RegisterRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _signForm(BuildContext context, WidgetRef ref) {
  final notifier = ref.watch(AuthProvider.provider.notifier);
  final reader = ref.read(RemoteUtil.provider);

  return Form(
    key: reader.loginKey,
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.heightR(0.01),
      ),
      height: context.heightR(.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldApp(
            label: 'email',
            hint: 'Enter your email',
            controller: reader.emailController,
            icon: Icons.email_outlined,
            type: TextInputType.emailAddress,
            valid: 'Email is Required',
          ),
          SizedBox(height: context.heightR(0.03)),
          TextFieldApp(
            label: 'password',
            hint: 'Enter your password',
            controller: reader.passwordController,
            icon: Icons.lock_outline,
            type: TextInputType.text,
            isPassword: true,
            valid: 'Password is Required',
          ),
          SizedBox(height: context.heightR(0.015)),
          GestureDetector(
            onTap: () {
              AutoRouter.of(context).push(const ForgotRoute());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.heightR(0.01),
              ),
              child: const Text(
                "Forgot Password",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ),
          const Spacer(),
          DefaultButton(
            text: "Login",
            press: () {
              if (reader.loginKey.currentState!.validate()) {
                notifier.login(context);
              }
            },
          ),
        ],
      ),
    ),
  );
}
