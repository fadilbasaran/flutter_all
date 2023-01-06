import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/product/language/langugage_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({Key? key}) : super(key: key);

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final key = GlobalKey();
  FocusNode focusNodeTextfieldOne = FocusNode();
  FocusNode focusNodeTextfieldTwo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Learn'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                  textInputAction: TextInputAction.next,
                  autofocus: true, //açıldığında burdan başlanılacaktır.
                  focusNode: focusNodeTextfieldOne,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                  maxLength: 30,
                  buildCounter: (context,
                      {int? currentLength, bool? isFocused, int? maxLength}) {
                    return _animatedContainer(currentLength);
                  },
                  inputFormatters: [TextProjectInputFormatter()._formatter],
                  decoration: _InputDecarotor().emailInput),
              TextField(
                focusNode: focusNodeTextfieldTwo,
                minLines: 2,
                maxLines: 4,
              )
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer _animatedContainer(int? currentLength) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      height: 10,
      width: 10.0 * (currentLength ?? 0),
      color: Colors.green,
      //color: Colors.green[100 * (currentLength ?? 0) ~/ 2],
    );
  }
}



class _InputDecarotor {
  final emailInput = InputDecoration(
    prefixIcon: const Icon(Icons.mail),
    border: const OutlineInputBorder(),
    labelText: LanguageItems.mailTitle,
  );
}

class TextProjectInputFormatter {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (oldValue.text == 'a') {
      return oldValue;
    }
    return newValue;
  });
}