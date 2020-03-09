import 'package:kortobaa_flutter_provider_boilerplate/domain/value_objects/login_request_body.dart';

import '../../domain/entities/user.dart';

abstract class IAuthApi {
  Future<User> loginUser(LoginRequestBody loginRequestBody);
}
