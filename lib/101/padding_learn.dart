import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Padding Learn'),
      ),
      body: Padding(
        padding: ProjectPadding.pagePaddingVertical,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Container(height: 100, color: Colors.amber),
            ),
            Padding(
              padding: ProjectPadding.pagePaddingAll,
              child: Container(
                  height: 100,
                  padding:
                      EdgeInsets.zero /*Padding kendi içinde tanımlanabilir*/,
                  color: Colors.orange),
            ),
            Padding(
              padding: ProjectPadding.pagePaddingOnlyRight +
                  ProjectPadding
                      .pagePaddingVertical, //+ opertaoru ile overide edilebilir
              child: const Text('ALİ'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectPadding {
  static const pagePaddingVertical = EdgeInsets.symmetric(vertical: 10);
  static const pagePaddingOnlyRight = EdgeInsets.only(right: 20);
  static const pagePaddingAll = EdgeInsets.all(20);
}
