import 'package:kortobaa_flutter_provider_boilerplate/data_source/remote/dio_client.dart';
import 'package:kortobaa_flutter_provider_boilerplate/bloc/models/user.dart';

import 'package:kortobaa_flutter_provider_boilerplate/domain/value_objects/login_request_body.dart';
import 'package:kortobaa_flutter_provider_boilerplate/services/exceptions/fetch_exception.dart';
import 'package:kortobaa_flutter_provider_boilerplate/services/interfaces/i_auth_api.dart';
import 'package:kortobaa_flutter_provider_boilerplate/data_source/remote/constants/endpoints.dart'
    as endpoints;

class AuthApi implements IAuthApi {
  final DioClient _dioClient;

  AuthApi(this._dioClient);

  @override
  Future<User> loginUser(LoginRequestBody loginRequestBody) async {
    try {
      final dynamic response =
          await _dioClient.post(endpoints.loginUser, data: loginRequestBody);
      if (response is Map<String, dynamic>) {
        return User.fromJson(response);
      } else {
        throw UserNotFoundException(loginRequestBody.email);
      }
    } catch (e) {
      rethrow;
    }
  }
}
