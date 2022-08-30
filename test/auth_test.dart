import 'package:flutter_boilerplate/blocs/model/login_model.dart';
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
  test('Check user login', () {
    const user = LoginModel(email: 'yousef.salah1@yahoo.com', password: '123-Apple-\$\$\$',);
    final repo = provider.read(Authentication.provider);
    expect(repo.login(user), completes);
  });
}
