import 'dart:isolate';

import 'package:shared_preferences/shared_preferences.dart';

class UserSaveViewModel {
  bool getReadData(String key, IStore preferences) {
    final response = preferences.getString(key);
    return response;
    //logicleri burda yap
  }
}

abstract class IStore {
  bool getString(String key);
}

class SharedPrefStore extends IStore {
  late final SharedPreferences preferences;

  SharedPrefStore(SharedPreferences sharedPreferences);
  @override
  bool getString(String key) {
    final response = preferences.getString(key);
    if (response?.isNotEmpty ?? false) {
      return true;
    } else {
      return false;
    }
  }
}

class MockStore extends IStore {
  @override
  bool getString(String key) {
    return false;
  }
}
