import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  final String _imagePath =
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3270&q=80';
  const ImageLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(child: PngImage(name: ImageItems().apple)),
            //SizedBox(height: 300, child: JpgImage(name: ImageItems().dogFreak)),
            Image.network(
              _imagePath,
              errorBuilder: ((context, error, stackTrace) => JpgImage(
                  name: ImageItems()
                      .dogFreak)), //eğer path de bir hata varsa bu resim gelecek
            )
          ],
        ));
  }
}

class PngImage extends StatelessWidget {
  final String name;
  const PngImage({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _pathNameImage,
      fit: BoxFit.cover,
    );
  }

  String get _pathNameImage => 'assets/images/$name.png';
}

class JpgImage extends StatelessWidget {
  final String name;
  const JpgImage({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _pathNameImage,
      fit: BoxFit.cover,
    );
  }

  String get _pathNameImage => 'assets/images/$name.jpg';
}

class ImageItems {
  final String dogFreak = 'dogIsFreak';
  final String apple = 'apple';
}
