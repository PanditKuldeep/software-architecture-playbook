import 'package:software_architecture_playbook/principles/srp/violation/offline_service.dart';
import 'package:software_architecture_playbook/principles/srp/violation/online_service.dart';

/// Demonstrates execution of the SRP-violating classes.
class SrpViolationRunner {
  final offlineService = OfflineService();
  final onlineService = OnlineService();

  void testOfflineWithdrawal() {
    offlineService.collectWithdrawalSlip();
    offlineService.fillWithdrawalSlip(50);
    final isApproved = offlineService.submitWithdrawalSlip();
    if (isApproved) {
      print('Cash: ${offlineService.collectCash()}');
    } else {
      print('Withdrawal failed: Amount must be greater than 100.');
    }
  }

  void testOnlineWithdrawal() {
    onlineService.selectTransferMode(TransferMode.upi);
    final isLoggedIn = onlineService.login('admin@google.com', 'admin@123');
    if (!isLoggedIn) {
      print('Enter valid credentials');
      return;
    }
    final isDetailsCorrect = onlineService.enterDetails(
      123456789,
      'Kuldeep Deepak Pandit',
    );
    if (!isDetailsCorrect) {
      print('Enter valid account details');
      return;
    }
    final isAmountValid = onlineService.enterAmount(150);
    if (!isAmountValid) {
      print('Amount must be greater than 100.');
      return;
    }

    final isAuthenticated = onlineService.authenticate(1234);
    if (isAuthenticated) {
      print('Cash: ${onlineService.collectCash()}');
    } else {
      print('Withdrawal failed: Enter valid mPin');
    }
  }
}

/// Backward compatibility alias
@Deprecated('Use SrpViolationRunner instead')
typedef ViolateSingleResponsiblePrinciple = SrpViolationRunner;
