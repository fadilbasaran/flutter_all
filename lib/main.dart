import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/lottie_learn.dart';
import 'package:flutter_full_learn/product/global/resource_contex.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:flutter_full_learn/product/navigator/navigator_custom.dart';
import 'package:flutter_full_learn/product/navigator/navigator_manager.dart';
import 'package:provider/provider.dart';

import '101/column_row.dart';
import '101/indicator_learn.dart';
import '101/list_tile_learn.dart';
import '101/page_view_learn.dart';
import '101/stack_learn.dart';
import '101/statefull_learn.dart';
import '101/text_field_learn.dart';
import 'demos/color_demos_views.dart';
import 'demos/color_life_cycle_view.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => ResourceContext()),
      ChangeNotifierProvider<ThemeNotifer>(create: (context) => ThemeNotifer())
    ],
    builder: (context, child) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget with NavigatorCustom {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Learning',
        theme: context.watch<ThemeNotifer>().currentTheme,
        onUnknownRoute: (settings) {
          MaterialPageRoute(builder: (context) => const LottieLearn());
          return null;
        },
        onGenerateRoute: onGenerateRoute,
        navigatorKey: NavigatorManager.instance.navigatorGlobalKey,

        // routes: NavgiatorRoutes().items,
        home: const ColorLifeCycleView());
  }
}
