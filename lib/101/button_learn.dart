import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Learn'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.green.shade200;
                }
                return Colors.white;
              }),
            ),
            child: Text('TextButton',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.blue)),
          ), //null verince deactive oluyor
          ElevatedButton(onPressed: () {}, child: const Text('ElavatedButton')),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.heart_broken_outlined)),
          FloatingActionButton(
            onPressed: () {
              //sayfanın rengini dğzenle
              //servise istek at vb
            },
            child: const Icon(Icons.add),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.amber,
              padding: const EdgeInsets.only(left: 12, right: 5),
            ),
            child: const SizedBox(
              width: 200,
              child: Text('OutlinedButton'),
            ),
          ),
          OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.healing_rounded),
              label: const Text('OutlinedButton Icon')),
          InkWell(onTap: () {}, child: const Text('Custom Button')),

          Container(
            height: 200,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, right: 40, left: 40),
              child: Text(
                'Padding verilen buton',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
