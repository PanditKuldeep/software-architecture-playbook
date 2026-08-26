enum TransferMode { neft, imps, upi, rtgs }

/// ❌ SRP VIOLATION EXAMPLE:
/// This class acts as a "God Object" taking on multiple unrelated responsibilities:
/// 1. User Authentication ([login], [authenticate]) -> Actor: Security Team
/// 2. Payment Gateway Mode Selection ([selectTransferMode]) -> Actor: Payments Team
/// 3. Beneficiary Account Validation ([enterDetails]) -> Actor: Compliance/KYC Team
/// 4. Business Policy Validation ([enterAmount]) -> Actor: Finance/Business Policy Team
/// 5. Cash Dispensing & State Management ([collectCash]) -> Actor: ATM Hardware/Vault Team
///
/// Any change requested by any of these 5 different actors will force modifications
/// to this single file, increasing risk of regression and merge conflicts.
class OnlineService {
  int _amount = 0;

  bool login(String email, String password) {
    return email.contains('admin@google.com') && password.contains('admin@123');
  }

  bool selectTransferMode(TransferMode mode) {
    switch (mode) {
      case TransferMode.neft:
      case TransferMode.imps:
      case TransferMode.upi:
      case TransferMode.rtgs:
        return true;
    }
  }

  bool enterDetails(int accountNo, String beneficiaryName) {
    return accountNo == 123456789 &&
        beneficiaryName.contains('Kuldeep Deepak Pandit');
  }

  bool enterAmount(int amount) {
    _amount = amount;
    return amount > 100;
  }

  bool authenticate(int pin) {
    return pin == 1234;
  }

  int collectCash() {
    return _amount;
  }
}
