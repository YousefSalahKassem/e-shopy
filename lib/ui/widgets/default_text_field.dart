import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/themes/dimensions.dart';

class TextFieldApp extends StatelessWidget {
  final String label;
  final String hint;
  final String valid;
  final TextEditingController controller;
  final IconData icon;
  final TextInputType type;
  final bool isPassword;
  const TextFieldApp({super.key,required this.label,required this.hint,required this.valid,required this.controller,required this.icon,required this.type , this.isPassword=false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          keyboardType: type,
          obscureText: isPassword,
          style: Theme.of(context).textTheme.bodyText1,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return valid;
            }
            return null;
          },
          decoration: InputDecoration(
            suffixIcon: Icon(icon, color : Theme.of(context).iconTheme.color),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hint,
            labelText: label,
            labelStyle: const TextStyle(
              color: Colors.grey,
              fontSize: sizeXSmall,
            ),
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: sizeXSmall,
            ),
          ),
        )
      ],
    );
  }
}
