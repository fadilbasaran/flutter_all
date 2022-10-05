import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(onPressed: () {}, child: const Text('Save')),
          ElevatedButton(onPressed: () {}, child: const Text('data')),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.heart_broken_outlined)),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: const EdgeInsets.all(10),
                shape: const CircleBorder()),
            child: const Text('data'),
          ),
          InkWell(onTap: () {}, child: const Text('custom')),
        ],
      ),
    );
  }
}
