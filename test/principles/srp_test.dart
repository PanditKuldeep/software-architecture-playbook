import 'package:software_architecture_playbook/principles/export.dart';
import 'package:test/test.dart';

void main() {
  group('Single Responsibility Principle (SRP) Tests', () {
    group('Refactored SRP Components (Isolated & Easily Testable)', () {
      test('AuthenticationService verifies credentials correctly', () {
        final authService = AuthenticationService();

        expect(authService.authenticate('admin@google.com', 'admin@123'), isTrue);
        expect(authService.authenticate('user@google.com', 'wrong_pass'), isFalse);
      });

      test('WithdrawalPolicy enforces minimum amount rules', () {
        final policy = WithdrawalPolicy();

        expect(policy.isAmountAllowed(150), isTrue);
        expect(policy.isAmountAllowed(50), isFalse);
      });

      test('BeneficiaryValidator validates account details accurately', () {
        final validator = BeneficiaryValidator();

        expect(validator.isValid(123456789, 'Kuldeep Deepak Pandit'), isTrue);
        expect(validator.isValid(999999999, 'Unknown User'), isFalse);
      });

      test('SrpRefactoredRunner executes both online and offline workflows cleanly', () {
        final runner = SrpRefactoredRunner();

        expect(() => runner.testOnlineWithdrawal(), returnsNormally);
        expect(() => runner.testOfflineWithdrawal(), returnsNormally);
      });
    });

    group('SRP Violation Example Runner', () {
      test('SrpViolationRunner executes monolith methods', () {
        final violationRunner = SrpViolationRunner();

        expect(() => violationRunner.testOnlineWithdrawal(), returnsNormally);
        expect(() => violationRunner.testOfflineWithdrawal(), returnsNormally);
      });
    });
  });
}
