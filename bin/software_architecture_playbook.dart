import 'package:software_architecture_playbook/principles/export.dart';

void main(List<String> arguments) {
  ViolateSingleResponsiblePrinciple().testOnlineWithdrawal();
  print('-------');
  RefactoredSingleResponsiblePrinciple().testOnlineWithdrawal();
}
