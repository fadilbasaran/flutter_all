import 'package:flutter/material.dart';

class TextLernView extends StatelessWidget {
  const TextLernView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          ('Buy the best one' * 10),
          maxLines: 2,
          style: const TextStyle(
              wordSpacing: 2,
              letterSpacing: 3,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
