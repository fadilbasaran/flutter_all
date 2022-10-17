import 'dart:io';

import 'package:flutter_full_learn/202/custom_excaption.dart';
import 'package:url_launcher/url_launcher_string.dart';

abstract class IFileDownload {
  bool? downoadItem(FileItem? fileItem);
  void toShare(String path) async {
    await launchUrlString(path);
  }
}

class FileDownload extends IFileDownload with ShareMixin{
  //O sınıfın özelliklerini alıp üstüne kendi özelliklerini entegre etmektir
  @override
  bool? downoadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadExcaption();

    return true;
  }
  

  @override
  void toShare(String path) async {
    await launchUrlString('sms:$path');
  }

  void shareSms() {}
}
class SMSDownload implements IFileDownload {
  //O sınıfın özelliklerini alıp üstüne kendi özelliklerini entegre etmektir
  @override
  bool? downoadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadExcaption();

    return true;
  }
  

  @override
  void toShare(String path) async {
    await launchUrlString('sms:$path');
  }

  void shareSms() {}
}

class FileItem {
  final String name;

  final File file;

  FileItem(this.name, this.file);
}

mixin ShareMixin on IFileDownload{
  // başına on koyularak sadece istilen classlar kullanabilir.
void toShowFile() {
  
}
}
