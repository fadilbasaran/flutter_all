import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/theme/light_theme.dart';

class ThemeNotifer extends ChangeNotifier {
  bool isLightTheme = true;
  String themeName = 'Dark';
  void changeTheme() {
    isLightTheme = !isLightTheme;
  }

  void changeName() {
    themeName == 'Light' ? themeName = 'Dark' : themeName = 'Light';
    notifyListeners();
  }

  ThemeData get currentTheme =>
      isLightTheme ? LightTheme().theme : ThemeData.dark();
}
