// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/mobix_image_picker/view_model/image_upload_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

import '../../../product/utility/image_upload.dart';

class MobxImageUpload extends StatefulWidget {
  const MobxImageUpload({super.key});

  @override
  State<MobxImageUpload> createState() => _MobxImageUploadState();
}

class _MobxImageUploadState extends State<MobxImageUpload> {
  final String _imageUploadLottiePath =
      'https://assets3.lottiefiles.com/packages/lf20_urbk83vw.json';

  final _imageUploadViewModel = ImageUploadViewModel();
  final _imageUploadManager = ImageUploadManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Upload'),
        actions: [
          Observer(builder: (_) {
            return _imageUploadViewModel.isLoading
                ? const FittedBox(
                    child: CircularProgressIndicator(color: Colors.white))
                : const SizedBox.shrink();
          })
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Card(
                      elevation: 10,
                      child: Row(
                        children: [
                          Observer(builder: (_) {
                            return Expanded(
                                flex: 4,
                                child: _imageUploadViewModel.file != null
                                    ? Image.file(_imageUploadViewModel.file!)
                                    : const SizedBox());
                          }),
                          Expanded(
                            child: IconButton(
                                onPressed: () {
                                  _imageUploadManager.fetchFromLibrary();
                                },
                                icon: Lottie.network(_imageUploadLottiePath)),
                          ),
                        ],
                      ))),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
