// ignore_for_file: unused_local_variable, avoid_print

import 'package:collection/collection.dart';
import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_full_learn/product/widget/card/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test(
    'List Best of',
    () {
      final users = [
        const GenericUser('fb1', '1', 34),
        const GenericUser('fb2', '2', 40),
        const GenericUser('fb3', '3', 50),
      ];
      List<HighCard> higCards = users.map((e) {
        return HighCard(items: e.name.split('').toList());
      }).toList();

      try {
        final response = users.singleWhere(
          (element) => element.findUserName('x'),
          orElse: () {
            return const GenericUser('Ab valla yok', 'id', 15);
          },
        );
        print(response.name);
      } catch (e) {
        prints(e);
      }

      print('${users.where((element) => element.money > 40)}');
      users.addAll([const GenericUser('eklend', 'id', 15)]);
      users.lastWhere((element) =>
          element.id == '5'); //Listenin en sonundan bana idsi 5 olanı getir

      users.take(5); //içinden 5 tane getir.
      users.remove(const GenericUser('fb1', '1', 34)); //id göre siler
      users.removeAt(2); //indexe göre siler
      users.removeWhere((element) => element.id == '10'); //id on olanı sil

      final result = users.indexWhere((element) => element.id == '1');
      if (result >= 0) {
        users[result] = const GenericUser('Ali', '332', 3434);
      }

      //users.map((e) => e.money).where((element) => element > 5);//Yan yan komutlar yazılabiliyor.

      users.expand((element) => [const GenericUser('ali', '23', 12)]);
      //insert etmek yerine büyütüyor Listeyi,
      users.sample(3); //Rastegele kaç değer istiyorsan san geri veriyor

      users.contains(const GenericUser('fb3', '3', 50));
    },
  );

  test('List Best of with collaction', () {
    final users = [
      const GenericUser('fb1', '1', 34),
      const GenericUser('fb2', '2', 40),
      const GenericUser('fb3', '3', 50),
    ];
    List<HighCard> higCards = users.map((e) {
      return HighCard(items: e.name.split('').toList());
    }).toList();

    final response = users.singleWhereOrNull(
      (element) => element.findUserName('x'),
    );
    users.lastWhereOrNull(
        (element) => element.id == '5'); //Varsa getir eğer yoksa null döndür

    users.lastOrNull;

    users.forEachIndexed((index,
        element) {}); //Hem elementi hem de kaçıncı sırada olduğuna bakabiliyorsun.

    prints(response);
  });
}
