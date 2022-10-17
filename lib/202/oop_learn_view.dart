import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/oop_learn.dart';

class OOPLeanrView extends StatefulWidget {
  const OOPLeanrView({super.key});

  @override
  State<OOPLeanrView> createState() => _OOPLeanrViewState();
}

class _OOPLeanrViewState extends State<OOPLeanrView> {
  FileDownload? download;

  @override
  void initState() {
    super.initState();
    download = FileDownload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          CircularProgressIndicator(
            color: Colors.white,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          download?.downoadItem(null);
        },
      ),
    );
  }
}
