import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_boilerplate/themes/dimensions.dart';
import 'package:flutter_boilerplate/themes/flavor/light/colors.dart';

class NoAccountText extends StatelessWidget {
  final VoidCallback onPressed;
  const NoAccountText({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: sizeXSmall),
        ),
        GestureDetector(
          onTap: onPressed,
          child: const Text(
            "Sign Up",
            style: TextStyle(
                fontSize: sizeXSmall,
                color: kPrimaryColor,),
          ),
        ),
      ],
    );
  }
}
