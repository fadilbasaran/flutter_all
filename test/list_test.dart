// ignore_for_file: unused_local_variable

import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_full_learn/product/widget/card/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('List Best of', () {
    final users = [
      GenericUser('fb', '1', 34),
      GenericUser('fb', '1', 34),
      GenericUser('fb', '1', 34),
    ];
    List<HighCard> higCards = users.map((e) {
      return HighCard(items: e.name.split('').toList());
    }).toList();
  });
}
