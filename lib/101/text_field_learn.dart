import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            autofocus: true,//atıldığında direk onu 
            focusNode: focusNodeTextfieldOne,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            maxLength: 20,
            buildCounter: (context,
                {int? currentLength, bool? isFocused, int? maxLength}) {
              return _animatedContainer(currentLength);
            },
            inputFormatters: [TextProjectInputFormatter()._formatter],
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.mail),
              border: OutlineInputBorder(),
              labelText: 'Mail',
            ),
          ),
          TextField(
            focusNode: focusNodeTextfieldTwo,
          )
        ],
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

class TextProjectInputFormatter {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (oldValue.text == 'a') {
      return oldValue;
    }
    return oldValue;
  });
}
