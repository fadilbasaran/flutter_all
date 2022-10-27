// ignore_for_file: no_leading_underscores_for_local_identifiers, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/lottie_learn.dart';
import 'package:flutter_full_learn/303/navigator/navigate_home_detail.dart';
import 'package:flutter_full_learn/main.dart';

import 'navigator_routs.dart';

mixin NavigatorCustom<T extends MyApp> on Widget {
  //Sadece MyAppten türeyebilir
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name?.isEmpty ?? true) {
      _navigateToNormal(const LoadingLottie());
    }

    if (routeSettings.name == NavgiatorRoutes.parag)
      return _navigateToNormal(const LottieLearn());

    final _routes = routeSettings.name == NavgiatorRoutes.parag
        ? NavRoutes.init
        : NavRoutes.values.byName(routeSettings.name!);

    switch (_routes) {
      case NavRoutes.init:
        break;
      case NavRoutes.home:
        break;
      case NavRoutes.detail:
        break;
    }

    if (routeSettings.name == '/') {
      return _navigateToNormal(const LottieLearn());
    } else if (routeSettings.name == '/homeDetail') {
      final _id = routeSettings.arguments;
      return _navigateToNormal(NavigateHomeDetail(
        id: _id is String ? _id : null,
      ));
    }
    return null;
  }

  Route<dynamic>? _navigateToNormal(Widget child) {
    return MaterialPageRoute(
      builder: (context) {
        return child;
      },
    );
  }
}
