import 'package:flutter_boilerplate/blocs/model/login_model.dart';
import 'package:flutter_boilerplate/blocs/model/register_model.dart';
import 'package:flutter_boilerplate/data/remote/apis/auth_api.dart';
import 'package:flutter_boilerplate/data/remote/constants/app_endpoints.dart';
import 'package:flutter_boilerplate/data/token_holder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart' as core;

void main() {
  final provider = ProviderContainer(
    overrides: [
      core.EndPoints.provider.overrideWithValue(AppEndPoint()),
      core.ITokenHolder.provider.overrideWithProvider(TokenHolder.provider),
    ],
  );
  group('Login Operations', () {
    test('Check user login', () {
      const user = LoginModel(
        email: 'yousef.salah1@yahoo.com', password: '123-Apple-\$\$\$',);
      final repo = provider.read(Authentication.provider);
      expect(repo.login(user), completes);
    });
    test('Check error login', () {
      const user = LoginModel(
        email: 'yousef.salah1@yahoo.com', password: '1234-Apple-\$\$\$',);
      final repo = provider.read(Authentication.provider);
      repo.login(user).then((value) => expect(value, isNull));
    });
  });

  group('Register Operations', () {
    test('Check user register', () {
      const user = RegisterModel(email: 'yousef.salah12@gmail.com',
          password: '123-Apple-\$',
          userName: 'yousef Qassem',);
      final repo = provider.read(Authentication.provider);
      expect(repo.register(user), completes);
    });
    test('Check password is weak', () {
      const user = RegisterModel(email: 'yousef.salah1@gmail.com',
          password: '123456',
          userName: 'yousef Qassem',);
      final repo = provider.read(Authentication.provider);
      repo.register(user).then((value) => expect(value, isNull));
    });
  });
}
