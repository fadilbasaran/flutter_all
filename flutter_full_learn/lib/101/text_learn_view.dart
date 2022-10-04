import 'package:flutter/material.dart';

class TextLernView extends StatelessWidget {
  const TextLernView({Key? key, this.userName}) : super(key: key);
  final String name = 'Fadıl';
  final String? userName;
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
              ('Welcome $name ${name.length}'),
              maxLines: 2,
              overflow: TextOverflow
                  .ellipsis, //Bu yapılar enum yapıları ile yapılıypr.
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
            Text(
              ('Hello $name ${name.length}'),
              maxLines: 2,
              overflow: TextOverflow
                  .ellipsis, //Bu yapılar enum yapıları ile yapılıypr.
              textAlign: TextAlign.right,
              style: ProjectStyle.welcomeStyle,
            ),
            Text(
              ('Hello $name ${name.length}'),
              maxLines: 2,
              overflow: TextOverflow
                  .ellipsis, //Bu yapılar enum yapıları ile yapılıypr.
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Colors.yellow,
                  ),
            ),
            Text(userName??''),
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
