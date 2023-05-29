import 'package:flutter_test/flutter_test.dart';
import 'package:formz_inputs/formz_inputs.dart';

void main() {
  group('Email', () {
    test('should have pure constructor with empty value', () {
      const email = Email.pure();

      expect(email.value, isEmpty);
    });

    test('should have dirty constructor with specified value', () {
      const value = 'dirty_value@example.com';
      const email = Email.dirty(value);

      expect(email.value, equals(value));
    });

    test('should return null if value is a valid email address', () {
      final validEmails = [
        'test@example.com',
        'user.name@example.com',
        'user+label@example.com',
        'user-name@example.co',
        'user.name@example.co.uk',
      ];

      for (final email in validEmails) {
        final emailInput = Email.dirty(email);

        final validationError = emailInput.validator(emailInput.value);

        expect(validationError, isNull);
      }
    });
  });
}
