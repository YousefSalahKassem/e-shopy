import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RemoteUtil {
  static final provider = Provider<RemoteUtil>((ref) => RemoteUtil._());

  RemoteUtil._();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _searchField = TextEditingController();

  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _updateUserKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _resetPasswordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _addressKey = GlobalKey<FormState>();

  GlobalKey<FormState> get loginKey => _loginKey;

  GlobalKey<FormState> get registerKey => _registerKey;

  GlobalKey<FormState> get updateUserKey => _updateUserKey;

  GlobalKey<FormState> get resetPasswordKey => _resetPasswordKey;

  GlobalKey<FormState> get addressKey => _addressKey;

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get nameController => _nameController;

  TextEditingController get confirmPasswordController => _confirmPasswordController;

  TextEditingController get countryController => _countryController;

  TextEditingController get cityController => _cityController;

  TextEditingController get streetController => _streetController;

  TextEditingController get postalCodeController => _postalCodeController;

  TextEditingController get searchField => _searchField;
}
