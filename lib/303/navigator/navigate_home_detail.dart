// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class NavigateHomeDetail extends StatefulWidget {
  const NavigateHomeDetail({super.key, this.id});
  final String? id;

  @override
  State<NavigateHomeDetail> createState() => _NavigateHomeDetailState();
}

class _NavigateHomeDetailState extends State<NavigateHomeDetail> {
  String? _id;

  @override
  void initState() {
    super.initState();
    _id = widget.id ?? '';

    if (_id == null) {
      Future.microtask(
        () {
          final modelid = ModalRoute.of(context)?.settings.arguments;
          print(modelid);
          setState(() {
            _id = modelid is String ? modelid : widget.id;
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[400],
      appBar: AppBar(
        title: Center(child: Text(_id ?? '')),
      ),
    );
  }
}
