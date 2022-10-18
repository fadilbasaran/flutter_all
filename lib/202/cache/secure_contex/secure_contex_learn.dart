import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureContexLearnView extends StatefulWidget {
  const SecureContexLearnView({super.key});

  @override
  State<SecureContexLearnView> createState() => _SecureContexLearnViewState();
}

enum _SecureKeys { token }

class _SecureContexLearnViewState extends State<SecureContexLearnView> {
  final _stronge = const FlutterSecureStorage();
  String _title = '';

  void saveItems(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getSecureItems();
  }

  Future<void> getSecureItems() async {
    _title = await _stronge.read(key: _SecureKeys.token.name) ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await _stronge.write(key: _SecureKeys.token.name, value: _title);
          },
          label: const Text('Save')),
      body: TextField(
        onChanged: saveItems,
      ),
    );
  }
}
