import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';

class CartScreen extends StatelessWidget {
   const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(LocaleKeys.yourCart.tr()),
    );
  }
}
