import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  const StatelessLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children:  [
          const TitleTextWidget(title: 'ali'),
          const TitleTextWidget(title: 'ali1'),
          const TitleTextWidget(title: 'ali2'),
          const TitleTextWidget(title: 'ali3'),
          const _CostumContainer(heigthCont: 100),
          _emptyBox(),
        ],
      ),
    );
  }

  SizedBox _emptyBox() => const SizedBox(height: 10);
}

class _CostumContainer extends StatelessWidget {
  const _CostumContainer({Key? key, required this.heigthCont})
      : super(key: key);
  final double heigthCont;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigthCont,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.amber,
      ),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
