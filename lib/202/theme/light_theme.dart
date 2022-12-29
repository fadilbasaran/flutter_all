import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();

  late ThemeData theme = ThemeData(
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.purple,
      ),
      primaryIconTheme: const IconThemeData(color: Colors.purple),
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
          backgroundColor: Colors.white,
          elevation: 30,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20)))),
      scaffoldBackgroundColor: Colors.white,
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: Colors.orange),
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.light(
            onPrimary: Colors.purple, onSecondary: _lightColor.textColor),
      ),
      colorScheme: const ColorScheme.light(),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(Colors.green),
      ),
      textTheme: ThemeData.light()
          .textTheme
          .copyWith(titleMedium: const TextStyle(fontSize: 20)));
}

class _LightColor {
  final Color textColor = const Color.fromARGB(255, 15, 13, 13);
  final Color blueMania = const Color.fromARGB(255, 22, 56, 84);
}
