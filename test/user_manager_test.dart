// ignore_for_file: unused_local_variable

import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test(
    'Calculate testing',
    () {
      final users = [
        GenericUser('Fb', '23', 30),
        GenericUser('Fb', '23', 30),
        GenericUser('Fb', '23', 30),
      ];
      final userManagment = UserManagement(AdminUser('vadmin', '1', 15, 2));
      final result = userManagment.calculateMoney(users);
      final response = userManagment.showNames<String>(users);
      expect(result, 90);
    },
  );
}
