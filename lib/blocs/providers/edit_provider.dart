import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/blocs/interface/i_auth_state.dart';
import 'package:flutter_boilerplate/blocs/interface/i_edit_provider.dart';
import 'package:flutter_boilerplate/blocs/model/forgot_model.dart';
import 'package:flutter_boilerplate/blocs/model/user.dart';
import 'package:flutter_boilerplate/data/remote/apis/auth_api.dart';
import 'package:flutter_boilerplate/data/remote/interface/i_authentication.dart';
import 'package:flutter_boilerplate/helpers/remote_util.dart';
import 'package:flutter_boilerplate/helpers/ui/ui_helpers.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class EditProvider extends StateNotifier<IAuthState> implements IEditProvider {
  static final provider = StateNotifierProvider((ref) {
    return EditProvider(
      ref.read(RemoteUtil.provider),
      ref.read(Authentication.provider),
      ref.read(SimpleLocalData.provider),
      ref.read(SecureUserData.provider),
    );
  });

  final RemoteUtil _remoteUtil;
  final IAuthentication _api;
  final SimpleLocalData _simpleLocalData;
  final SecureUserData _secureUserData;

  EditProvider(
    this._remoteUtil,
    this._api,
    this._simpleLocalData,
    this._secureUserData,
  ) : super(const AuthProviderInitial());

  @override
  Future<void> changeName(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final user = await _simpleLocalData.readJsonMap('userData');
    final token = await _secureUserData.read(const StorageKey('token'));
    final authToken = token?.get<String>();
    final userData = User.fromJson(user!);

    if (userData.id!.isNotEmpty && token != null) {
      await _api.updateUserName(_remoteUtil.nameController.text, authToken!, userData.id!).whenComplete(() {
        userData.name = _remoteUtil.nameController.text;
        _simpleLocalData.writeJsonMap('userData', userData.toJson());
        state = AuthProviderLoaded(userData);
        AutoRouter.of(context).replace(const LandingRoute());
      });
    }
  }

  @override
  Future<void> resetPassword(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final resetPasswordRequest = ForgotModel(
      email: _remoteUtil.emailController.text,
    );
    await _api.resetPassword(resetPasswordRequest).whenComplete(() {
      UiHelpers.showNotification('check_your_email');
      AutoRouter.of(context).replace(const LoginRoute());
    });
  }
}
