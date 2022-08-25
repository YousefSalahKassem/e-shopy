import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RemoteUtil {
  static final provider = Provider<RemoteUtil>((ref) => RemoteUtil._());

  RemoteUtil._();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _updateUserKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _resetPasswordKey = GlobalKey<FormState>();

  GlobalKey<FormState> get loginKey => _loginKey;

  GlobalKey<FormState> get registerKey => _registerKey;

  GlobalKey<FormState> get updateUserKey => _updateUserKey;

  GlobalKey<FormState> get resetPasswordKey => _resetPasswordKey;

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get nameController => _nameController;

  TextEditingController get confirmPasswordController => _confirmPasswordController;

}
