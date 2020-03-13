import 'package:meta/meta.dart';

import '../exceptions/validation_exception.dart';

@immutable
class LoginRequestBody {
  final String email;
  final String password;

  LoginRequestBody(this.email, this.password) {
    if (!email.contains('@')) {
      throw ValidationException('Your email must contain "@"');
    }
    if (password.length < 2) {
      throw ValidationException('Password must be longer than 2 letters');
    }
  }
}
