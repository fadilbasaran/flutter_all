// ignore_for_file: avoid_print, unused_local_variable, no_leading_underscores_for_local_identifiers

class UserManagement<T extends AdminUser> {
  final T admin;

  UserManagement(this.admin);
  void sayName(GenericUser user) {
    print(user.name);
  }

  Iterable<FBModel<R>>? showNames<R>(List<GenericUser> users) {
    if (R == String) {
      final names =
          users.map((e) => FBModel<R>(e.name.split('').toList().cast<R>()));
      return names;
    }
    return null;
  }

  int calculateMoney(List<GenericUser> users) {
    int sum = 0;
    for (var item in users) {
      sum += item.money;
    }
    //Eğer admin gelirse 15 eklenilsin
    int initialValue = admin.role == 1 ? admin.money : 0;

    final sumMoney = users.map((e) => e.money).fold<int>(
        initialValue, (previousValue, element) => previousValue + element);
    final _money = users.fold<int>(initialValue,
        (previousValue, element) => previousValue + element.money);
    return _money;
  }
}

class GenericUser {
  final String name;
  final String id;

  final int money;

  GenericUser(this.name, this.id, this.money);
}

class AdminUser extends GenericUser {
  final int role;
  AdminUser(super.name, super.id, super.money, this.role);
}

class FBModel<T> {
  final String name = 'vb';
  final List<T> items;

  FBModel(this.items);
}
