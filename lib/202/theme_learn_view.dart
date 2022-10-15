import 'package:flutter/material.dart';

class ThemeLearnView extends StatefulWidget {
  const ThemeLearnView({super.key});

  @override
  State<ThemeLearnView> createState() => _ThemeLearnViewState();
}

class _ThemeLearnViewState extends State<ThemeLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      body: Column(children: [
        CheckboxListTile(
          value: true,
          onChanged: (value) {},
          title: Text(
            'Select',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        )
      ]),
    );
  }
}
