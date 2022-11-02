import 'package:flutter/cupertino.dart';

import 'navigator_routs.dart';

class NavigatorManager {
  NavigatorManager._();
  static NavigatorManager instance = NavigatorManager._();
  final GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey();

  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

  Future<void> pushToPage(NavRoutes routes, {Object? arguments}) async {
    await _navigatorGlobalKey.currentState
        ?.pushNamed(routes.withParaf, arguments: arguments);
  }
}
