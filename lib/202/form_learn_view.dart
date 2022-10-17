// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        autovalidateMode: AutovalidateMode
            .always, //Compement başlar başlamaz kontorol edilecek
        key: _key,
        onChanged: () => print('heree'),
        child: Column(children: [
          TextFormField(validator: FormFieldValidator().isNotEmpty),
          TextFormField(validator: FormFieldValidator().isNotEmpty),
          DropdownButtonFormField<String>(
            validator: FormFieldValidator().isNotEmpty,
            items: const [
              DropdownMenuItem(value: 'v1', child: Text('a')),
              DropdownMenuItem(value: 'v2', child: Text('a')),
              DropdownMenuItem(value: 'v3', child: Text('a')),
            ],
            onChanged: (value) {},
          ),
          _chekSet(),
          ElevatedButton(
              onPressed: (() {
                if (_key.currentState?.validate() ?? false) {
                  print('okey');
                }
              }),
              child: const Text('Save'))
        ]),
      ),
    );
  }

  CheckboxListTile _chekSet() {
    return CheckboxListTile(
      subtitle: const Text('sdada'),
      title:const Text('Hayat eve sığar') ,
      value: true,
      onChanged: (value) {},
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValiadatorMessage._isNotEmpty;
  }
}

class ValiadatorMessage {
  static const String _isNotEmpty = 'Bu alan boş geçilemez';
}
