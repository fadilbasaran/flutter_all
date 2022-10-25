// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/constant/duration_items.dart';
import 'package:flutter_full_learn/product/constant/lottie_items.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:flutter_full_learn/product/navigator/navigator_routs.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn>
    with TickerProviderStateMixin {
  late AnimationController _contoller;
  bool isLight = false;

  @override
  void initState() {
    super.initState();
    _contoller = AnimationController(
        vsync: this, duration: DurationItems.durationNormal());
    navigateToHome();
  }

  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.of(context).pushReplacementNamed(NavRoutes.home.withParaf);
    //Gittiği Sayfada geri gelemiyor.
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<ThemeNotifer>().changeTheme(),
        ),
        appBar: AppBar(
          actions: [
            InkWell(
                onTap: () async {
                  await _contoller.animateTo(isLight ? 0.5 : 1);
                  isLight = !isLight;
                  Future.microtask(
                      () => context.read<ThemeNotifer>().changeTheme());
                },
                child: LottieBuilder.asset(
                  LottieItems.themeChange.lottiePath,
                  controller: _contoller,
                  repeat: false,
                ))
          ],
        ),
        body: const LoadingLottie(),
      ),
    );
  }
}

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    Key? key,
  }) : super(key: key);
  final _loadingLottieUrl =
      'https://assets3.lottiefiles.com/datafiles/bEYvzB8QfV3EM9a/data.json';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.network(_loadingLottieUrl),
    );
  }
}
