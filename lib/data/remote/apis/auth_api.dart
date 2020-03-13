import 'package:kortobaa_flutter_provider_boilerplate/blocs/models/user.dart';
import 'package:kortobaa_flutter_provider_boilerplate/blocs/validators/login_request_body.dart';
import 'package:kortobaa_flutter_provider_boilerplate/data/remote/dio_client.dart';
import 'package:kortobaa_flutter_provider_boilerplate/services/exceptions/fetch_exception.dart';
import 'package:kortobaa_flutter_provider_boilerplate/services/interfaces/i_auth_api.dart';
import 'package:kortobaa_flutter_provider_boilerplate/data/remote/constants/endpoints.dart'
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
