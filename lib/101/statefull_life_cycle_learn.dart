import 'package:flutter/material.dart';

class StatefullLifeCycleLearn extends StatefulWidget {
  const StatefullLifeCycleLearn({Key? key, required this.message})
      : super(key: key);
  final String message;
  @override
  State<StatefullLifeCycleLearn> createState() =>
      _StatefullLifeCycleLearnState();
}

class _StatefullLifeCycleLearnState extends State<StatefullLifeCycleLearn> {
  String _message = '';
  late final bool _isOdd;
  @override
  void initState() {
    super.initState();

    _message = widget.message;
    _isOdd = widget.message.length.isOdd;

    _computeName();
  }

  @override
  void didChangeDependencies() {
    //bütün yenilendiğinde çalışır

    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant StatefullLifeCycleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message != widget.message) {
      _message = widget.message;
      _computeName();
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    _message = '';
  }

  void _computeName() {
    if (_isOdd) {
      _message += ' Tek';
    } else {
      _message += ' Çift';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isOdd ? Text(_message) : Text(_message),
      ),
      body: _isOdd //Çift ise text, Tek ise elevated button kullanılacak
          ? TextButton(onPressed: () {}, child: Text(_message))
          : ElevatedButton(onPressed: () {}, child: Text(_message)),
    );
  }
}
