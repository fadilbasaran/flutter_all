import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _CostumCard(
            child: SizedBox(
                height: 100,
                width: 300,
                child: Center(
                  child: Text(
                    'Ali',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                )),
          ),
          _CostumCard(
              child: SizedBox(
            height: 100,
            width: 300,
            child: Center(
              child: Text(
                'Ali',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class _CostumCard extends StatelessWidget {
  final Widget child;
  final roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
  _CostumCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: ProjectMargins.cardMarginAll,
      elevation: 10,
      child: child,
    );
  }
}

class ProjectMargins {
  static const cardMarginAll = EdgeInsets.all(10);
  static final roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
}
