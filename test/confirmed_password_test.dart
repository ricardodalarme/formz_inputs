import 'package:flutter_test/flutter_test.dart';
import 'package:formz_inputs/formz_inputs.dart';

void main() {
  group('ConfirmedPassword', () {
    test('should have pure constructor with empty value', () {
      const password = 'password';
      const confirmedPassword = ConfirmedPassword.pure(password: password);

      expect(confirmedPassword.value, isEmpty);
      expect(confirmedPassword.password, equals(password));
    });

    test('should have dirty constructor with specified value', () {
      const password = 'password';
      const value = 'dirty_value';
      const confirmedPassword =
          ConfirmedPassword.dirty(password: password, value: value);

      expect(confirmedPassword.value, equals(value));
      expect(confirmedPassword.password, equals(password));
    });

    test('should return null if value matches the password', () {
      const password = 'password';
      const confirmedPassword =
          ConfirmedPassword.dirty(password: password, value: password);

      final validationError =
          confirmedPassword.validator(confirmedPassword.value);

      expect(validationError, isNull);
    });

    test('should return invalid if value does not match the password', () {
      const password = 'password';
      const confirmedPassword =
          ConfirmedPassword.dirty(password: password, value: 'wrong_password');

      final validationError =
          confirmedPassword.validator(confirmedPassword.value);

      expect(validationError, equals(ConfirmedPasswordValidationError.invalid));
    });
  });
}
