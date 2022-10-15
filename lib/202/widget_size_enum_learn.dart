import 'package:flutter/material.dart';

class WidgetSizeenumLearnView extends StatefulWidget {
  const WidgetSizeenumLearnView({super.key});

  @override
  State<WidgetSizeenumLearnView> createState() =>
      _WidgetSizeenumLearnViewState();
}

class _WidgetSizeenumLearnViewState extends State<WidgetSizeenumLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Container(
          height: WidgetSizes.normalCardHeight.value(),
          color: Colors.green,
        ),
      ),
    );
  }
}

enum WidgetSizes { normalCardHeight, circleProfile }

extension WidgetSizeExtantion on WidgetSizes {
  double value() {
    switch (this) {
      case WidgetSizes.normalCardHeight:
        return 40;

      case WidgetSizes.circleProfile:
        return 25;
    }
  }
}
