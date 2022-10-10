import 'package:flutter/material.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({Key? key}) : super(key: key);

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  int _countValue = 0;
  void incrementValue() {
    setState(() {
      _countValue += 1;
    });
  }

  void deincrementValue() {
    setState(() {
      _countValue -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _incrementButton(() {
            incrementValue();
          }),
          _deincrementButton(() {
            deincrementValue();
          }),
        ],
      ),
      body: Center(
        child: Text(
          '$_countValue',
          style: Theme.of(context)
              .textTheme
              .headline2
              ?.copyWith(color: Colors.amber),
        ),
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
