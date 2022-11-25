import 'package:flutter/material.dart';

class ImageUploadManager extends StatefulWidget {
  const ImageUploadManager({super.key});

  @override
  State<ImageUploadManager> createState() => _ImageUploadManagerState();
}

class _ImageUploadManagerState extends State<ImageUploadManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text("Fetch from galery")),
            ElevatedButton(
                onPressed: () {}, child: const Text("Fetch from normal")),
            ElevatedButton(
                onPressed: () {}, child: const Text("Fetch from multiple")),
          ],
        ));
  }
}
