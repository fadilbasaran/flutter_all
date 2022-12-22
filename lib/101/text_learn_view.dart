import 'package:flutter/material.dart';

class TextLernView extends StatelessWidget {
  TextLernView({Key? key, this.userName}) : super(key: key);
  final String name = 'Fadıl';
  final String? userName;
  final ProjectKeys keys = ProjectKeys();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ('Welcome $name ${name.length}' * 30),
              maxLines: 2, //Maksimum satır sayısı
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: TextStyle(
                  wordSpacing: 2,
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 3,
                  color: ProjectColor.welcomeColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              ('Hello $name ${name.length}'),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: ProjectStyle.welcomeStyle,
            ),
            Text(
              ('Hello $name ${name.length}'),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: ProjectColor.welcomeColor,
                  ),
            ),
            Text(userName ?? ''),
            Text(keys.welcome),
          ],
        ),
      ),
    );
  }
}

class ProjectStyle {
  static TextStyle welcomeStyle = const TextStyle(
      wordSpacing: 2,
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.italic,
      letterSpacing: 3,
      color: Colors.orange,
      fontSize: 16,
      fontWeight: FontWeight.w600);
}

class ProjectColor {
  static Color welcomeColor = Colors.red;
}

class ProjectKeys {
  final String welcome = 'Merhaba';
}
