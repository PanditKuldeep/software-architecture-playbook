import 'package:software_architecture_playbook/principles/srp/refactored_export.dart';

/// ✅ ORCHESTRATOR FOR OFFLINE WITHDRAWALS:
/// Orchestrates offline in-branch withdrawal workflow by coordinating dedicated single-responsibility components:
/// - [SlipProcessor] (paper slip handling)
/// - [WithdrawalPolicy] (business rules - shared with online channel!)
/// - [CashDispenser] (cash dispensing hardware - shared with online channel!)
class OfflineWithdrawalService {
  final SlipProcessor slipProcessor;
  final WithdrawalPolicy withdrawalPolicy;
  final CashDispenser cashDispenser;

  OfflineWithdrawalService({
    required this.slipProcessor,
    required this.withdrawalPolicy,
    required this.cashDispenser,
  });

  void withdraw({required int amount}) {
    if (!slipProcessor.processSlip(amount: amount)) {
      print('Withdrawal failed: Slip verification failed.');
      return;
    }

    if (!withdrawalPolicy.isAmountAllowed(amount)) {
      print('Withdrawal failed: Amount must be greater than 100.');
      return;
    }

    cashDispenser.dispense(amount);
  }
}
