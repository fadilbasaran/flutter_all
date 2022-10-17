import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends State<SharedLearn> {
  int _currentValue = 0;

  void _onCahangeValue(String value) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _value = int.tryParse(value);

    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();

          await prefs.setInt('counter', _currentValue);
        },
        child: const Icon(Icons.save),
      ),
      appBar: AppBar(
        title: Text(_currentValue.toString()),
      ),
      body: TextField(
        onChanged: _onCahangeValue,
      ),
    );
  }
}
