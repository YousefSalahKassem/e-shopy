import 'package:flutter_test/flutter_test.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

void main() {
  group('email_validation', () {
    const EmailValidator emailValidator = EmailValidator();
    test('email 1', () {
      const email = 'ahmed@gmail.com';

      final result = emailValidator.validate(email);
      expect(result, null);
    });
    test('email 2', () {
      const email = '';
      final result = emailValidator.validate(email);
      expect(result, "change to localization error");
    });
    test('email 3', () {
      const email = 'ahmed';
      final result = emailValidator.validate(email);
      expect(result, "change to localization error");
    });
  });
}
