import 'package:software_architecture_playbook/principles/srp/refactored_export.dart';

/// ✅ ORCHESTRATOR FOR ONLINE WITHDRAWALS:
/// Rather than doing the work itself (which violates SRP), this class acts as a high-level
/// orchestrator (Use Case / Facade). Its single responsibility is coordinating the online workflow.
///
/// It delegates specific tasks to dedicated single-responsibility classes:
/// - [AuthenticationService] for identity verification
/// - [BeneficiaryValidator] for account validation
/// - [WithdrawalPolicy] for business rules (shared across online & offline!)
/// - [TransferService] for gateway processing
/// - [CashDispenser] for cash dispensing (shared across online & offline!)
class OnlineWithdrawalService {
  final AuthenticationService authenticationService;
  final BeneficiaryValidator beneficiaryValidator;
  final WithdrawalPolicy withdrawalPolicy;
  final TransferService transferService;
  final CashDispenser cashDispenser;

  OnlineWithdrawalService({
    required this.authenticationService,
    required this.beneficiaryValidator,
    required this.withdrawalPolicy,
    required this.transferService,
    required this.cashDispenser,
  });

  void withdraw({
    required String email,
    required String password,
    required int accountNo,
    required String beneficiaryName,
    required int amount,
  }) {
    if (!authenticationService.authenticate(email, password)) {
      print('Invalid credentials');
      return;
    }

    if (!beneficiaryValidator.isValid(accountNo, beneficiaryName)) {
      print('Invalid beneficiary details');
      return;
    }

    if (!withdrawalPolicy.isAmountAllowed(amount)) {
      print('Amount must be greater than 100');
      return;
    }

    if (!transferService.transfer(amount)) {
      print('Transfer failed');
      return;
    }

    cashDispenser.dispense(amount);
  }
}