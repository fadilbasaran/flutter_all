import 'package:flutter/material.dart';

import 'state_learn_view_model.dart';

class StateLearnView extends StatefulWidget {
  const StateLearnView({super.key});

  @override
  State<StateLearnView> createState() => _StateLearnViewState();
}

class _StateLearnViewState extends StateLearViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeOpacity();
          changeVisible();
        },
      ),
      appBar: AppBar(
        backgroundColor: isOpacity ? Colors.amber : Colors.blue,
        shadowColor: isVisible ? Colors.black26 : Colors.green,
      ),
    );
  }
}
