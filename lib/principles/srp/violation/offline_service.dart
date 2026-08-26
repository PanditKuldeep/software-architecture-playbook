/// ❌ SRP VIOLATION EXAMPLE:
/// Handles paper slip collection, verification logic (business policy), and physical cash dispensing
/// all inside a single class.
class OfflineService {
  int _amount = 0;

  void collectWithdrawalSlip() {
    print('collected withdrawal slip');
  }

  void fillWithdrawalSlip(int amount) {
    print('filled withdrawal slip');
    _amount = amount;
  }

  bool submitWithdrawalSlip() {
    print('verify withdrawal slip');
    return _amount > 100;
  }

  int collectCash() {
    return _amount;
  }
}
