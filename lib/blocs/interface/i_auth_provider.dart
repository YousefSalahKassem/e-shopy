import 'package:flutter/material.dart';

abstract class IAuthProvider{
  Future<void> login(BuildContext context);
  Future<void> register(BuildContext context);
  void logout(BuildContext context);
}
