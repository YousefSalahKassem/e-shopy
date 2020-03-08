import 'package:kortobaa_flutter_provider_boilerplate/domain/value_objects/email.dart';

import '../../domain/entities/user.dart';

abstract class IAuthApi {
  Future<User> loginUser(LoginRequestBody loginRequestBody);
}
