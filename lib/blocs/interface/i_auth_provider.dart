import 'package:flutter/material.dart';

/// TODO not save to pass context in provider for example if you want navigate need to await login in your screen then you can navigate
/// TODO this requirment for if provider has changed not effect the design
abstract class IAuthProvider {
  Future<void> login(BuildContext context);
  Future<void> register(BuildContext context);
  void logout(BuildContext context);
}
