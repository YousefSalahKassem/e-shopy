import 'package:flutter/cupertino.dart';

/// TODO use json serializable for generate toJson or fromJson map models
@immutable
class LoginModel {
  final String email;
  final String password;

  const LoginModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {'email': email.trim(), 'password': password.trim()};
  }

  LoginModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
