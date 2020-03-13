import 'package:kortobaa_flutter_provider_boilerplate/bloc/models/user.dart';
import 'package:kortobaa_flutter_provider_boilerplate/bloc/vaildators/login_request_body.dart';

abstract class IAuthApi {
  Future<User> loginUser(LoginRequestBody loginRequestBody);
}
