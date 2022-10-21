import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/global/resource_contex.dart';
import 'package:provider/provider.dart';

class ImageLearn extends StatefulWidget {
  const ImageLearn({Key? key}) : super(key: key);

  @override
  State<ImageLearn> createState() => _ImageLearnState();
}

class _ImageLearnState extends State<ImageLearn> {
  final String _imagePath =
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3270&q=80';
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              context.read<ResourceContext>().model?.data?.length.toString() ??
                  ''),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<ResourceContext>().clear();
                  refresh();
                },
                icon: const Icon(Icons.remove_circle))
          ],
        ),
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
