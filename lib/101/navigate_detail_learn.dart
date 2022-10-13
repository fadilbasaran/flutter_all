import 'package:flutter/material.dart';

class NavigateDetailLearn extends StatefulWidget {
  const NavigateDetailLearn({Key? key, this.isOkay = false}) : super(key: key);
  final bool isOkay;

  @override
  State<NavigateDetailLearn> createState() => _NavigateDetailLearnState();
}

class _NavigateDetailLearnState extends State<NavigateDetailLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop(!widget.isOkay);//gelen neyse tam tersi yap
              },
              icon: Icon(Icons.check,
                  color: widget.isOkay ? Colors.red : Colors.green),
              label: widget.isOkay ? const Text('Red') : const Text('Onayla'))),
    );
  }
}
