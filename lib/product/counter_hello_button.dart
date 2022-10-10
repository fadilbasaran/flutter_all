import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/language/langugage_items.dart';

class CounterHelloButton extends StatefulWidget {
  const CounterHelloButton({Key? key}) : super(key: key);

  @override
  State<CounterHelloButton> createState() => _CounterHelloButtonState();
}

class _CounterHelloButtonState extends State<CounterHelloButton> {
  int _counterCostum = 0;
  void _updateCounter() {
    setState(() {
      ++_counterCostum;
    });
  }

  final String _welcomeTitle = LanguageItems.welcomeTitle;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _updateCounter(),
      child: Text('$_welcomeTitle  $_counterCostum'),
    );
  }
}
