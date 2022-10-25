import '../../303/lottie_learn.dart';
import '../../303/navigator/navigate_home_detail.dart';
import '../../303/navigator/navigate_home_view.dart';

class NavgiatorRoutes {
  static const _parag = '/';
  final items = {
    _parag: (contex) => const LottieLearn(),
    NavRoutes.home.withParaf: (context) => const NavigateHOmeView(),
    NavRoutes.detail.withParaf: (context) => const NavigateHomeDetail(),
  };
}

enum NavRoutes { init, home, detail }

extension NavigatorRoutesExt on NavRoutes {
  String get withParaf => '/$name';
}
