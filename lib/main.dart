import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/theme/light_theme.dart';

import '202/package_learn_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Learning',
      theme:LightTheme().theme,

      // ThemeData.dark().copyWith(
      //     bottomAppBarTheme: const BottomAppBarTheme(
      //       shape: CircularNotchedRectangle(),
      //     ),
      //     //bottomAppBarColor: Colors.white,
      //     tabBarTheme: const TabBarTheme(
      //         labelColor: Colors.orange,
      //         indicatorSize: TabBarIndicatorSize.label),
      //     textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.red)),
      //     inputDecorationTheme: const InputDecorationTheme(
      //         filled: true, labelStyle: TextStyle(color: Colors.orange)),
      //     progressIndicatorTheme:
      //         const ProgressIndicatorThemeData(color: Colors.white),
      //     cardTheme: CardTheme(
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(20))),
      //     errorColor: const Color.fromARGB(255, 237, 97, 183),
      //     appBarTheme: const AppBarTheme(
      //         centerTitle: true,
      //         systemOverlayStyle: SystemUiOverlayStyle.light,
      //         backgroundColor: Colors.transparent,
      //         elevation: 0)),
      home: const PackageLearnView(),
    );
  }
}
