import 'package:flutter/widgets.dart';
import 'package:flutter_full_learn/product/global/resource_contex.dart';

import '../model/resource_model.dart';
import '../service/reqres_service.dart';

class ReqresProvider extends ChangeNotifier {
  late final IReqresService reqresService;
  List<Data> resource = [];
  bool isLoading = true;

  ReqresProvider(this.reqresService) {
    _fetch();
    _chnageLoading();
  }

  Future<void> _fetch() async {
    _chnageLoading();
    resource =await fetchItems();
    _chnageLoading();
  }

  Future<List<Data>> fetchItems() async {
    return resource = (await reqresService.fetchResourceItem())?.data ?? [];
  }

  void _chnageLoading() {
    isLoading = !isLoading;
    notifyListeners(); //Bu metoda her hangi bir şey olduğunda bana bidirmeyi yarıyor.
  }

  bool? saveToLocale(ResourceContext resourceContext, List<Data> resource) {
    resourceContext.saveModel(ResourceModel(data: resource));
    return resourceContext.model?.data?.isEmpty;
  }
}
