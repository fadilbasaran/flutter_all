import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/package/loading_bar.dart';

import 'package/launch_manager.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView>
    with TickerProviderStateMixin, LunchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            launchUrl('https://pub.dev/packages/url_launcher');
          },
        ),
        body: const LoadingBar(
          size: 100,
        ));
  }
}
