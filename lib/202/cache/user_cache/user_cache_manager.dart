import 'dart:convert';

import 'package:flutter_full_learn/202/cache/shared_learn_cache_view.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';

class UserCaheManger {
  final SharedManager sharedManager;

  UserCaheManger(this.sharedManager);
  void saveItems(List<User> items) {
    //jsona dönüştür
//compute
    final _item = items.map((element) => jsonEncode(element)).toList();

    sharedManager.saveItmesString(SharedKeys.users, _item);
  }

  List<User>? getItems() {
    final itemString = sharedManager.getItemsString(SharedKeys.users);

    if (itemString?.isNotEmpty ?? false) {
      return itemString!.map((element) {
        final jsonObject = jsonDecode(element);
        return User('name', 'descriptoin', 'url');
      }).toList();
    }
    return null;
  }
}
