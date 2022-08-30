import 'package:flutter/material.dart';

abstract class IAuthProvider{
  Future<bool> login();
  Future<bool> register();
  void logout(BuildContext context);
}
