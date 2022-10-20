import 'dart:math';

import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  final bool Function(int number)? onNumber;

  const AnswerButton({super.key, this.onNumber});

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

Color? _background;
String? _text;
bool? response;

class _AnswerButtonState extends State<AnswerButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: _background),
        onPressed: () {
          final int result = Random().nextInt(10);

          final response = widget.onNumber?.call(result) ?? false;

          setState(() {
            if (response) {
              _background = Colors.green;
              _text = 'Bildiniz';
            } else {
              _background = Colors.red;

              _text = 'Yanıldınız';
            }
          });
        },
        child: Text(_text ?? 'Seç'));
  }
}
