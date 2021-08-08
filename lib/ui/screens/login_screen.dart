import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/dimensions.dart';

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
            const SizedBox(
              height: kSpaceLarge,
            ),
            TextFormField(),
            const SizedBox(
              height: kSpaceSmall,
            ),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
