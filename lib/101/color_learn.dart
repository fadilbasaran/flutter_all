import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Theme.of(context).colorScheme.error,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'data',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: ColorsItems.viola, fontSize: 26),
          ),
        ),
      ),
    );
  }
}

class ColorsItems {
  static const Color sulu = Color(0xFFCBED61);
  static const Color viola = Color.fromRGBO(198, 128, 170, 1);
}
