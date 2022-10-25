import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/navigator/navigator_routs.dart';

class NavigateHOmeView extends StatefulWidget {
  const NavigateHOmeView({super.key});

  @override
  State<NavigateHOmeView> createState() => _NavigateHOmeViewState();
}

class _NavigateHOmeViewState extends State<NavigateHOmeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Navigator.of(context).pushNamed(NavRoutes.detail.withParaf,arguments: 'abc');
        },
        child: const Icon(Icons.abc),
      ),
      appBar: AppBar(
        title: Text(toString()),
      ),
    );
  }
}
