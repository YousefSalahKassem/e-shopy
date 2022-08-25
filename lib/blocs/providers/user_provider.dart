import 'package:flutter_boilerplate/blocs/interface/i_auth_state.dart';
import 'package:flutter_boilerplate/blocs/interface/i_user_provider.dart';
import 'package:flutter_boilerplate/blocs/model/user.dart';
import 'package:flutter_boilerplate/data/remote/apis/auth_api.dart';
import 'package:flutter_boilerplate/data/remote/interface/i_authentication.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class UserProvider extends StateNotifier<IAuthState> implements IUserProvider {
  static final provider = StateNotifierProvider((ref) {
    return UserProvider(
      ref.read(SimpleLocalData.provider),
      ref.read(SecureUserData.provider),
      ref.read(Authentication.provider),
    );
  });

  final SimpleLocalData _simpleLocalData;
  final SecureUserData _secureUserData;
  final IAuthentication _api;

  String? _authToken;
  bool get checkAuthToken => _authToken != null;

  UserProvider(this._simpleLocalData, this._secureUserData, this._api): super(const AuthProviderInitial());

  @override
  Future<void> getUserData() async {
    final userData = await _simpleLocalData.readJsonMap('userData');
    if (userData != null) {
      final user = User.fromJson(userData);
      state = AuthProviderLoaded(user);
    }
  }

  @override
  Future<bool> isTokenValid() async{
    final tokenValue = await _secureUserData.read(const StorageKey('token'));
    _authToken = tokenValue?.get<String>();
    if (_authToken == null) {
      return false;
    }
    await _api.checkTokenExpiry(_authToken!).then((value) {
      if (value == true) {
        return true;
      }
    });
    return false;
  }

}
