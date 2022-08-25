import 'package:flutter_boilerplate/blocs/model/forgot_model.dart';
import 'package:flutter_boilerplate/blocs/model/login_model.dart';
import 'package:flutter_boilerplate/blocs/model/register_model.dart';
import 'package:flutter_boilerplate/blocs/model/user.dart';
import 'package:flutter_boilerplate/data/remote/constants/endpoints.dart';
import 'package:flutter_boilerplate/data/remote/interface/i_authentication.dart';
import 'package:flutter_boilerplate/helpers/ui/ui_helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart' as core;

class Authentication implements IAuthentication {
  static final provider = Provider<IAuthentication>((ref) {
    return Authentication._(ref.watch(core.RemoteClient.provider(null)));
  });

  final core.RemoteClient _remoteClient;
  Map<String, String> headers = {'Content-Type': 'application/json'};

  Authentication._(this._remoteClient);

  @override
  Future<UserResponse> register(RegisterModel registerRequest) async {
    try {
      final url = EndPoint.signUpUrl;

      final response = await _remoteClient.request(
        core.RemoteMethod.POST,
        url,
        data: registerRequest.toJson(),
        headers: headers,
        authPolicy: core.RemoteAuthPolicy.prohibited,
      );

      if (response.statusCode == 201) {
        return UserResponse.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to register');
      }
    } on core.RemoteException catch (e) {
      UiHelpers.showNotification(e.message.toString());
      throw Exception(e.message);
    }
  }

  @override
  Future<void> resetPassword(ForgotModel data) async {
    try {
      final url = EndPoint.forgotPasswordUrl;

      final response = await _remoteClient.request(
        core.RemoteMethod.POST,
        url,
        data: data,
        headers: headers,
        authPolicy: core.RemoteAuthPolicy.prohibited,
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to reset password');
      }
    } on core.RemoteException catch (e) {
      UiHelpers.showNotification(e.message.toString());
      throw Exception(e.message);
    }
  }

  @override
  Future<void> updateUserName(
    String userName,
    String authToken,
    String userId,
  ) {
    final url = EndPoint.changeNameUrl;
    headers.putIfAbsent('Authorization', () => 'Bearer $authToken');
    final bodyObject = <String, String>{};
    bodyObject.putIfAbsent('name', () => userName);
    final response = _remoteClient.request(
      core.RemoteMethod.PATCH,
      '$url$userId',
      data: bodyObject,
      headers: headers,
      authPolicy: core.RemoteAuthPolicy.prohibited,
    );
    return response;
  }

  @override
  Future<UserResponse> login(LoginModel loginRequest) async {
    try {
      final url = EndPoint.signInUrl;
      final response = await _remoteClient.request(
        core.RemoteMethod.POST,
        url,
        data: loginRequest.toJson(),
        headers: headers,
        authPolicy: core.RemoteAuthPolicy.prohibited,
      );
      if (response.statusCode == 200) {
        return UserResponse.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to login');
      }
    } on core.RemoteException catch (e) {
      UiHelpers.showNotification(e.message.localize());
      throw Exception(e.message.localize());
    }
  }

  @override
  Future<bool> checkTokenExpiry(String authToken) async {
    final url = EndPoint.checkTokenExpiryUrl;
    final token = <String, String>{};
    token.putIfAbsent('token', () => authToken);
    final response = await _remoteClient.request(
      core.RemoteMethod.POST,
      url,
      data: token,
      headers: headers,
      authPolicy: core.RemoteAuthPolicy.prohibited,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to check token expiry');
    }
  }
}
