import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actions: const [CenterCirculerRedProgress()],
      ),
      body: const LinearProgressIndicator()
    );
  }
}

class CenterCirculerRedProgress extends StatelessWidget {
  const CenterCirculerRedProgress({
    Key? key,
  }) : super(key: key);
  final Color redColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: redColor,
      strokeWidth: 10,
      //value: 0.45,//veri çekililrken kullanılıyor bu değer
      backgroundColor: Colors.white,
    ));
  }
}
