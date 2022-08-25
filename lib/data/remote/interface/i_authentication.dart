import 'package:flutter_boilerplate/blocs/model/forgot_model.dart';
import 'package:flutter_boilerplate/blocs/model/login_model.dart';
import 'package:flutter_boilerplate/blocs/model/register_model.dart';
import 'package:flutter_boilerplate/blocs/model/user.dart';

abstract class IAuthentication {
  Future<UserResponse> login(LoginModel loginRequest);
  Future<UserResponse> register(RegisterModel registerRequest);
  Future<bool> checkTokenExpiry(String authToken);
  Future<void> resetPassword(ForgotModel data);
  Future<void> updateUserName(String userName, String authToken, String userId);
}