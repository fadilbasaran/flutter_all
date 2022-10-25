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

    Future.microtask(
      () {
        final _modelid = ModalRoute.of(context)?.settings.arguments;
        print(_modelid);
        setState(() {
          _id = _modelid is String ? _modelid : widget.id;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(_id ?? '')),
      ),
    );
  }
}
