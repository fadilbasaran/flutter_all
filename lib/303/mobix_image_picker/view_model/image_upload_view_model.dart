// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'image_upload_view_model.g.dart';

class ImageUploadViewModel = _ImageUploadViewModelBase
    with _$ImageUploadViewModel;

abstract class _ImageUploadViewModelBase with Store {
  @observable 
  File? file;
  @observable //Ekranda dinlemek istenliyorsa
  bool isLoading = false;

  @action //Ekran bir haber verilecek ise
  void changeLoading() {
    isLoading = !isLoading;
  }
   @action
  void saveLocalFile(XFile? file) {
    if (file == null) return;
    this.file = File(file.path);
  }

  intit() {}
}
