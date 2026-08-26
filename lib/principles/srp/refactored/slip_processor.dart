/// ✅ SINGLE RESPONSIBILITY:
/// Handles only paper-based physical withdrawal slip operations (collect, fill, verify).
class SlipProcessor {
  bool processSlip({required int amount}) {
    print('Collected paper withdrawal slip.');
    print('Filled withdrawal slip for amount: \$amount.');
    print('Verified physical signature and slip details.');
    return true;
  }
}
