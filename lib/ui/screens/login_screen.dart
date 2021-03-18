import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/helpers/ui/ui_helpers.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Icon(
              Icons.login,
              size: 100,
              semanticLabel: "login_icon",
            ),
            UiHelper.verticalSpaceLarge(),
            TextFormField(),
            UiHelper.verticalSpaceSmall(),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
