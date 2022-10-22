// ignore_for_file: unused_local_variable

import 'package:collection/collection.dart';
import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_full_learn/product/widget/card/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('List Best of', () {
    final users = [
      GenericUser('fb1', '1', 34),
      GenericUser('fb2', '2', 40),
      GenericUser('fb3', '3', 50),
    ];
    List<HighCard> higCards = users.map((e) {
      return HighCard(items: e.name.split('').toList());
    }).toList();

    try {
      final response = users.singleWhere(
        (element) => element.findUserName('x'),
        orElse: () {
          return GenericUser('null', 'id', 15);
        },
      );
      print(response.name);
    } catch (e) {
      prints(e);
    }
  });

  test('List Best of with collaction', () {
    final users = [
      GenericUser('fb1', '1', 34),
      GenericUser('fb2', '2', 40),
      GenericUser('fb3', '3', 50),
    ];
    List<HighCard> higCards = users.map((e) {
      return HighCard(items: e.name.split('').toList());
    }).toList();

    final response = users.singleWhereOrNull(
      (element) => element.findUserName('x'),
    );
    prints(response);
  });
}
