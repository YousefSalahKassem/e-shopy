import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/providers/auth_provider.dart';
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
                  const Text("Register Account", style: headingStyle),
                  const Text(
                    "Complete your details or continue \nwith social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: context.heightR(0.1)),
                  _registerForm(context,ref),
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
                  Text(
                    'By continuing your confirm that you agree \nwith our Term and Condition',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


Widget _registerForm(BuildContext context, WidgetRef ref){
  final notifier =ref.watch(AuthProvider.provider.notifier);
  final reader = ref.read(RemoteUtil.provider);
  return Form(
      key: reader.registerKey,
      child:Column(
        children: [
          TextFieldApp(label: 'userName', hint: 'Enter your userName', controller: reader.nameController, icon: Icons.person, type: TextInputType.text, valid: 'UserName is Required',),
          SizedBox(height: context.heightR(0.03)),
          TextFieldApp(label: 'email', hint: 'Enter your email', controller: reader.emailController, icon: Icons.email_outlined, type: TextInputType.emailAddress, valid: 'Email is Required',),
          SizedBox(height: context.heightR(0.03)),
          TextFieldApp(label: 'password', hint: 'Enter your password', controller: reader.passwordController, icon: Icons.lock_outline, type: TextInputType.text, isPassword: true, valid: 'Password is Required',),
          SizedBox(height: context.heightR(0.03)),
          TextFieldApp(label: 'confirm password', hint: 'Enter your password', controller: reader.confirmPasswordController, icon: Icons.lock_outline, type: TextInputType.text, isPassword: true, valid: 'Password is Required',),
          SizedBox(height: context.heightR(0.04)),
          DefaultButton(
            text: "Register",
            press: () {
              if (reader.registerKey.currentState!.validate() && reader.passwordController.text == reader.confirmPasswordController.text) {
                notifier.register(context);
              }
            },
          ),
        ],
      ),
  );
}
