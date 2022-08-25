import 'package:flutter/material.dart';

@immutable
class RegisterModel {
  final String email;
  final String userName;
  final String password;


  const RegisterModel({
    required this.email,
    required this.userName,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': userName.trim(),
      'email': email.trim(),
      'password': password.trim(),
    };
  }

  RegisterModel copyWith({
    String? email,
    String? userName,
    String? password,
  }) {
    return RegisterModel(
      email: email ?? this.email,
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }

}
