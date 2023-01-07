import 'package:flutter/material.dart';
import 'package:flutter_full_learn/demos/password_text_field.dart';

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
      body: Column(
        children: [
          const PasswordTextField(),
          Card(
            child: Container(
              height: WidgetSizes.normalCardHeight.value(),
              color: Colors.black,
            ),
          ),
        ],
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
