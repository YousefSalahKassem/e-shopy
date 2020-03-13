import 'package:kortobaa_flutter_provider_boilerplate/blocs/models/user.dart';
import 'package:kortobaa_flutter_provider_boilerplate/blocs/validators/login_request_body.dart';

abstract class IAuthApi {
  Future<User> loginUser(LoginRequestBody loginRequestBody);
}
