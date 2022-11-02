import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/mixin/navigator_mixin.dart';
import 'package:flutter_full_learn/product/navigator/navigator_routs.dart';

class NavigateHOmeView extends StatefulWidget {
  const NavigateHOmeView({super.key});

  @override
  State<NavigateHOmeView> createState() => _NavigateHOmeViewState();
}

class _NavigateHOmeViewState extends State<NavigateHOmeView> with NavigatorMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () async {
          //Navigator.of(context).pushNamed(NavRoutes.detail.withParaf, arguments: 'abc');

          await router.pushToPage(NavRoutes.detail, arguments: "fadıl");
          //await NavigatorManager.pushToPage(NavRoutes.detail, arguments: "fadıl");
        },
        child: const Icon(Icons.abc),
      ),
      appBar: AppBar(
        title: Text(toString()),
      ),
    );
  }
}
