import 'package:flutter/material.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({super.key});

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ImagePaths.dogIsFreak.toWidget(),
    );
  }
}

enum ImagePaths { dogIsFreak, apple }

extension ImagePathExtantion on ImagePaths {
  String path() {
    return 'assets/images/$name.jpg';
  }

  Widget toWidget() {
    return Image.asset(path());
  }
}
