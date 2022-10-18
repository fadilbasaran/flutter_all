import 'dart:convert';

import 'package:flutter_full_learn/202/cache/shared_manager.dart';

import '../user_model.dart';

class UserCacheManger {
  final SharedManager sharedManager;

  UserCacheManger(this.sharedManager);
  Future<void> saveItems(List<User> items) async {
    //jsona dönüştür
//compute
    final item = items.map((element) => jsonEncode(element.toJson())).toList();

    await sharedManager.saveItmesString(SharedKeys.users, item);
  }

  List<User>? getItems() {
    final itemString = sharedManager.getItemsString(SharedKeys.users);

    if (itemString?.isNotEmpty ?? false) {
      return itemString!.map((element) {
        final json = jsonDecode(element);
        if (json is Map<String, dynamic>) {
          return User.fromJson(json);
        }
        return User('', '', '');
      }).toList();
    }
    return null;
  }
}
