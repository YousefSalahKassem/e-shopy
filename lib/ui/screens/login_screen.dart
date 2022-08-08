import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/dimensions.dart';
import 'package:flutter_boilerplate/ui/widgets/custom_appbar.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Login',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Icon(
              Icons.login,
              size: 100,
              semanticLabel: "login_icon",
            ),
            const SizedBox(
              height: spaceLarge,
            ),
            TextFormField(),
            const SizedBox(
              height: spaceSmall,
            ),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
