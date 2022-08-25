import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/providers/edit_provider.dart';
import 'package:flutter_boilerplate/helpers/remote_util.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_boilerplate/ui/widgets/default_button.dart';
import 'package:flutter_boilerplate/ui/widgets/default_text_field.dart';
import 'package:flutter_boilerplate/ui/widgets/no_account_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class ForgotScreen extends ConsumerWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.heightR(0.02)),
        child: Column(
          children: [
            SizedBox(height: context.heightR(0.2)),
            Text(
              "Forgot Password",
              style: TextStyle(
                fontSize: context.heightR(0.03),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Please enter your email and we will send \nyou a link to return to your account",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: context.heightR(0.1)),
            _forgotForm(context,ref),
          ],
        ),
      ),
    );
  }
}

Widget _forgotForm(BuildContext context, WidgetRef ref) {
  final notifier = ref.read(EditProvider.provider.notifier);
  final reader = ref.read(RemoteUtil.provider);
  return Form(
    key: reader.registerKey,
    child: Column(
      children: [
        TextFieldApp(
            label: 'Email',
            hint: 'Enter your email',
            valid: 'email is required',
            controller: reader.emailController,
            icon: Icons.email_outlined,
            type: TextInputType.emailAddress,
        ),
        SizedBox(height: context.heightR(0.03)),
        SizedBox(height: context.heightR(0.1)),
        DefaultButton(
          text: "Reset Password",
          press: () {
            if (reader.registerKey.currentState!.validate()) {
              notifier.resetPassword(context);
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
  );
}
