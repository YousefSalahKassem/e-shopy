import 'package:kortobaa_flutter_provider_boilerplate/data_source/remote/dio_client.dart';
import 'package:kortobaa_flutter_provider_boilerplate/domain/entities/user.dart';
import 'package:kortobaa_flutter_provider_boilerplate/domain/value_objects/email.dart';
import 'package:kortobaa_flutter_provider_boilerplate/service/exceptions/fetch_exception.dart';
import 'package:kortobaa_flutter_provider_boilerplate/service/interfaces/i_auth_api.dart';
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
