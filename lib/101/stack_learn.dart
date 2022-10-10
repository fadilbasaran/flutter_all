import 'package:flutter/material.dart';

class StcakLearn extends StatelessWidget {
  const StcakLearn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(color: Colors.red, height: 100),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(color: Colors.blue, height: 100),
          ),
          Positioned(
              right: 30,
              left: 20,
              height: 50,
              top: 0,
              child: Container(color: Colors.green)),
          Positioned(
              right: 30,
              left: 20,
              height: 25,
              top: 15,
              child: Container(color: Colors.white)),
          Positioned(
              right: size.width / 2,
              //left: 20,
              height: size.height,
              width: 25,
              bottom: 0,
              child: Container(
                color: Colors.white,
                width: 20,
              )),
        ],
      ),
    );
  }
}
