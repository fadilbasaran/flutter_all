import 'package:flutter/material.dart';
import 'package:flutter_full_learn/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: const RandomImage(),
                  onTap: () {},
                  subtitle: const Text('How do you use your card'),
                  minVerticalPadding: 0,
                  dense: true,
                  leading: Container(
                    height: 200,
                    width: 30,
                    alignment: Alignment.topCenter,
                    color: Colors.red,
                    child: const Icon(Icons.money),
                  ),
                  trailing: const SizedBox(
                    width: 20,
                    child: Icon(Icons.chevron_right),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
