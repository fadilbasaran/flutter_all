import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/counter_hello_button.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({Key? key}) : super(key: key);

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  int _countValue = 0;

  void _updateCounter(bool isIncrement) {
    if (isIncrement) {
      setState(() {
        _countValue += 1;
      });
    } else {
      setState(() {
        _countValue -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateful Learn'),),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _incrementButton(() {
            _updateCounter(true);
          }),
          _deincrementButton(() {
            _updateCounter(false);
          }),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Text('$_countValue',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: Colors.amber)),
          ),
          const Placeholder(),
          const CounterHelloButton(),
        ],
      ),
    );
  }

  FloatingActionButton _incrementButton(Function() onPressed) =>
      FloatingActionButton(onPressed: onPressed, child: const Icon(Icons.add));

  Padding _deincrementButton(Function() onPressed) {
    //final void Function() onPressed;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: FloatingActionButton(
          onPressed: onPressed, child: const Icon(Icons.remove)),
    );
  }
}
