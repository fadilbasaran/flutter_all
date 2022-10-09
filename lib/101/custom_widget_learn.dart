import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget with _ColorUtulity {
  CustomWidgetLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'Food',
            style: Theme.of(context).textTheme.headline5?.copyWith(),
          ),
        ),
      ),
    );
  }
}

class _ColorUtulity {
  final Color redColor = Colors.red;
}
