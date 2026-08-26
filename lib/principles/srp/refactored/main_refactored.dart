import 'package:software_architecture_playbook/principles/srp/refactored_export.dart';

/// Demonstrates execution of cleanly separated, single-responsibility services.
class SrpRefactoredRunner {
  // Shared single-responsibility components reused across different withdrawal channels!
  final withdrawalPolicy = WithdrawalPolicy();
  final cashDispenser = CashDispenser();

  void testOnlineWithdrawal() {
    final authenticationService = AuthenticationService();
    final beneficiaryValidator = BeneficiaryValidator();
    final transferService = TransferService();

    final onlineService = OnlineWithdrawalService(
      authenticationService: authenticationService,
      beneficiaryValidator: beneficiaryValidator,
      withdrawalPolicy: withdrawalPolicy, // Shared business policy
      transferService: transferService,
      cashDispenser: cashDispenser, // Shared hardware component
    );

    onlineService.withdraw(
      email: 'admin@google.com',
      password: 'admin@123',
      accountNo: 123456789,
      beneficiaryName: 'Kuldeep Deepak Pandit',
      amount: 150,
    );
  }

  void testOfflineWithdrawal() {
    final slipProcessor = SlipProcessor();

    final offlineService = OfflineWithdrawalService(
      slipProcessor: slipProcessor,
      withdrawalPolicy: withdrawalPolicy, // Shared business policy
      cashDispenser: cashDispenser, // Shared hardware component
    );

    offlineService.withdraw(amount: 150);
  }
}

/// Backward compatibility alias
@Deprecated('Use SrpRefactoredRunner instead')
typedef RefactoredSingleResponsiblePrinciple = SrpRefactoredRunner;
