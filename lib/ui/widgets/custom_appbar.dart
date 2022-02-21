import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title, this.height, this.bottom})
      : super(key: key);

  final String title;
  final double? height;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize => Size(
        double.infinity,
        (height ?? kToolbarHeight) + (bottom?.preferredSize.height ?? 0),
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      toolbarHeight: height, // don't set manually
      bottom: bottom, // don't set manually
    );
  }
}
