import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_boilerplate/helpers/fields_validator.dart';

void main() {
  group('email_validation', () {
    test('email 1', () {
      const email = 'ahmed@gmail.com';
      final result = email.validateEmail();
      expect(result, null);
    });
    test('email 2', () {
      const email = '';
      final result = email.validateEmail();
      expect(result, "change to localization error");
    });
    test('email 3', () {
      const email = 'ahmed';
      final result = email.validateEmail();
      expect(result, "change to localization error");
    });
  });
}
