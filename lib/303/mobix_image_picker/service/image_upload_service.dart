import 'package:dio/dio.dart';

import 'package:flutter/services.dart';

class ImageUploadService {
  final Dio dio;

  ImageUploadService(this.dio);

  void uploadImageServer(Uint8List byteArray, String name) async {
   await dio.post('full%2F$name.png',
        data: byteArray, onSendProgress: (int sent, int total) {});
  }
}
