import 'package:flutter_full_learn/303/reqrest_resource/model/resource_model.dart';

class ResourceContext {
  ResourceModel? model;

  void save(ResourceModel? model) {
    this.model = model;
  }
}
