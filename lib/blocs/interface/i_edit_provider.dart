import 'package:flutter/cupertino.dart';

abstract class IEditProvider {
  Future<void> changeName(BuildContext context);
  Future<void> resetPassword(BuildContext context);
}
