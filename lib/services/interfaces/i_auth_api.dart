import 'package:kortobaa_flutter_provider_boilerplate/bloc/models/user.dart';
import 'package:kortobaa_flutter_provider_boilerplate/bloc/validators/login_request_body.dart';

abstract class IAuthApi {
  Future<User> loginUser(LoginRequestBody loginRequestBody);
}
