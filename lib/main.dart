import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/101/color_learn.dart';
import 'package:flutter_full_learn/demos/stack_demo_view.dart';

import '101/stack_learn.dart';
import '101/statefull_learn.dart';


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
      theme: ThemeData.dark().copyWith(
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: Colors.white),
          cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          errorColor: ColorsItems.sulu,
          appBarTheme: const AppBarTheme(
            
              centerTitle: true,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              backgroundColor: Colors.transparent,
              elevation: 0)),
      home: const StatefullLearn(),
    );
  }
}
