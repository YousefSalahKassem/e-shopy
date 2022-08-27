import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';
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
        Text(
          LocaleKeys.dontHaveAccount.tr(),
          style: const TextStyle(fontSize: sizeXSmall),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            LocaleKeys.signup.tr(),
            style: const TextStyle(
              fontSize: sizeXSmall,
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
