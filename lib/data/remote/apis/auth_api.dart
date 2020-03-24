import 'package:provider_boilerplate/blocs/models/user.dart';
import 'package:provider_boilerplate/blocs/validators/login_request_body.dart';
import 'package:provider_boilerplate/data/remote/dio_client.dart';
import 'package:provider_boilerplate/data/remote/constants/endpoints.dart'
    as endpoints;
import 'package:provider_boilerplate/data/remote/interfaces/i_auth_api.dart';
import 'package:provider_boilerplate/exceptions/fetch_exception.dart';

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
