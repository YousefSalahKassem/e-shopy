import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/interface/i_auth_provider.dart';
import 'package:flutter_boilerplate/blocs/interface/i_auth_state.dart';
import 'package:flutter_boilerplate/blocs/model/login_model.dart';
import 'package:flutter_boilerplate/blocs/model/register_model.dart';
import 'package:flutter_boilerplate/blocs/model/user.dart';
import 'package:flutter_boilerplate/data/remote/apis/auth_api.dart';
import 'package:flutter_boilerplate/data/remote/interface/i_authentication.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';
import 'package:flutter_boilerplate/helpers/remote_util.dart';
import 'package:flutter_boilerplate/helpers/ui/ui_helpers.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class AuthProvider extends StateNotifier<IAuthState> implements IAuthProvider {
  static final provider = StateNotifierProvider((ref) {
    return AuthProvider(
      ref.read(Authentication.provider),
      ref.read(SimpleLocalData.provider),
      ref.read(SecureUserData.provider),
      ref.read(RemoteUtil.provider),
    );
  });

  final IAuthentication _api;
  final SimpleLocalData _simpleLocalData;
  final SecureUserData _secureUserData;
  final RemoteUtil _remoteUtil;

  AuthProvider(this._api, this._simpleLocalData, this._secureUserData, this._remoteUtil,) : super(const AuthProviderInitial());

  @override
  Future<void> login(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final loginRequest = LoginModel(
      email: _remoteUtil.emailController.text,
      password: _remoteUtil.passwordController.text,
    );
    state = const AuthProviderLoading();
    await _api.login(loginRequest).then((value) {
      if (value
          .toString()
          .isNotEmpty) {
        _saveUserData(value);
        UiHelpers.showNotification('welcome ${value.user.name}',isError: false);
        AutoRouter.of(context).replace(const LandingRoute());
      }
    });
  }

  @override
  Future<void> register(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final registerRequest = RegisterModel(
      email: _remoteUtil.emailController.text,
      password: _remoteUtil.passwordController.text,
      userName: _remoteUtil.nameController.text,
    );
    await _api.register(registerRequest).then((value) {
      if (value
          .toString()
          .isNotEmpty) {
        _saveUserData(value);
        UiHelpers.showNotification('welcome ${value.user.name}',isError: false);
        AutoRouter.of(context).replace(const LandingRoute());
      }
    });
  }

  Future<void> _saveUserData(UserResponse user) async {
    _simpleLocalData.writeJsonMap('userData', user.user.toJson());
    if (user.token.isNotEmpty) {
      await _secureUserData.write(
        const StorageKey('token'),
        CodableString(user.token),
      );
    }
  }

  @override
  void logout(BuildContext context) {
    UiHelpers.showSimpleAlertDialog(
        context: context,
        action: () {
          _simpleLocalData.delete('userData');
          _secureUserData.delete(const StorageKey('token'));
          AutoRouter.of(context).replace(const LoginRoute());
        },
        message: LocaleKeys.logoutAlert.tr(),
        okButtonText: LocaleKeys.confirm.tr(),
        cancelButtonText: LocaleKeys.cancel.tr(),
    );
  }

  @override
  void dispose() {
    _remoteUtil.emailController.clear();
    _remoteUtil.passwordController.clear();
    _remoteUtil.nameController.clear();
    _remoteUtil.confirmPasswordController.clear();
    super.dispose();
  }

}
