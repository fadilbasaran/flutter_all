import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 200,
            child: Text('a' * 500),
          ),
          const SizedBox.shrink(), //Boş bir alan oluşturmak için kullanılıyor.
          SizedBox.square(
            dimension: 50,
            child: Text('b' * 50),
          ),
          Container(
            //width: 50,
            //height: 50,

            constraints: const BoxConstraints(
                maxWidth: 200, minWidth: 100, minHeight: 10, maxHeight: 100),
            padding:
                const EdgeInsets.all(10), //İçerdeki lompomete verebilirsiniz
            margin: const EdgeInsets.all(10),

            decoration: ProjectUtiltiy.boxDcoration,
            child: Text('aa' * 100, maxLines: 2),
          ),
        ],
      ),
    );
  }
}

class ProjectUtiltiy {
  static BoxDecoration boxDcoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: const LinearGradient(colors: [Colors.blue, Colors.yellow]),
      boxShadow: const [
        BoxShadow(color: Colors.green, offset: Offset(0.1, 1), blurRadius: 12)
      ],
      //color: Colors.red,
      //shape: BoxShape.circle,
      border:
          Border.all(width: 10, color: const Color.fromARGB(221, 146, 30, 30)));
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(colors: [Colors.blue, Colors.yellow]),
          boxShadow: const [
            BoxShadow(
                color: Colors.green, offset: Offset(0.1, 1), blurRadius: 12)
          ],
          //color: Colors.red,
          //shape: BoxShape.circle,
          border: Border.all(
            width: 10,
            color: const Color.fromARGB(221, 146, 30, 30),
          ),
        );
}
