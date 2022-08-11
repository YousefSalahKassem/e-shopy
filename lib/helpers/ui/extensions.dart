import 'package:flutter/material.dart';

/// *** Extensions on BuildContext class *** ----------------
extension SugarExt on BuildContext {
  void closeKeyboard() {
    FocusScope.of(this).requestFocus(FocusNode());
  }
}
