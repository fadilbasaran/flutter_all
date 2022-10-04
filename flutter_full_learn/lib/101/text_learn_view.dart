import 'package:flutter/material.dart';

class TextLernView extends StatelessWidget {
  const TextLernView({Key? key}) : super(key: key);
  final String name = 'Fadıl';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Learning'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.heart_broken_outlined),
        ),
      ),
      body: Center(
        child: Text(
          ('Welcome $name'),
          maxLines: 2,
          overflow:
              TextOverflow.ellipsis, //Bu yapılar enum yapıları ile yapılıypr.
          textAlign: TextAlign.right,
          style: const TextStyle(
              wordSpacing: 2,
              decoration: TextDecoration.underline,
              fontStyle: FontStyle.italic,
              letterSpacing: 3,
              color: Colors.orange,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
