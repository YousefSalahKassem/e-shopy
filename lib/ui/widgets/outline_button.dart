import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/flavor/light/colors.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class OutLineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  const OutLineButton({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.widthR(0.2),
      child: MaterialButton(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),),
          onPressed: onPressed,
          child: Icon(icon, color: kPrimaryColor,)
      ),
    );
  }
}
