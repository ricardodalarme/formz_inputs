import 'package:flutter_test/flutter_test.dart';
import 'package:formz_inputs/formz_inputs.dart';

void main() {
  group('Password', () {
    test('should have pure constructor with empty value', () {
      const password = Password.pure();

      expect(password.value, isEmpty);
    });

    test('should have dirty constructor with specified value', () {
      const value = 'dirty_value';
      const password = Password.dirty(value);

      expect(password.value, equals(value));
    });

    test('should return null if value is a valid password', () {
      final validPasswords = ['Abcd1234', 'Password123'];

      for (final password in validPasswords) {
        final passwordInput = Password.dirty(password);

        final validationError = passwordInput.validator(passwordInput.value);

        expect(validationError, isNull);
      }
    });
  });
}
