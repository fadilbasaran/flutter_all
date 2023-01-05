import 'package:flutter/material.dart';

class ColumnAndRowLeaern extends StatelessWidget {
  const ColumnAndRowLeaern({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Column and Row Learn'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4, //Ekran oranı flex ile yapılyor
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.amber)),
                Expanded(child: Container(color: Colors.green)),
                Expanded(child: Container(color: Colors.yellow)),
                Expanded(child: Container(color: Colors.blue)),
              ],
            ),
          ),
          const Spacer(flex: 2),
          Expanded(
              child: Row(
            //mainAxisSize: MainAxisSize.min,//Minimum veya maksimum ayara getiriliyor.

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: const [
              Text('a1'),
              Text('a2'),
              Text('a3'),
            ],
          )),
          SizedBox(
            height: ProjectContainerSizes.cardHeight,
            child: Column(
              children: const [
                Expanded(child: Text('data')),
                Expanded(child: Text('data')),
                Expanded(child: Text('data')),
                Spacer(),
                Expanded(child: Text('data')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectContainerSizes {
  static const double cardHeight = 200;
}
