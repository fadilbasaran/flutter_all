import 'package:shared_preferences/shared_preferences.dart';

class UserSaveViewModel {
  bool getReadData(String key, SharedPreferences sharedPreferences) {
    final response = sharedPreferences.getString(key);
    if (response?.isNotEmpty ?? false) {
      return true;
    } else {
      return false;
    }
  }
}
