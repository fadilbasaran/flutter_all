import 'package:flutter/widgets.dart';

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
    resource = (await reqresService.fetchResourceItem())?.data ?? [];
    _chnageLoading();
  }

  void _chnageLoading() {
    isLoading = !isLoading;
    notifyListeners(); //Bu metoda her hangi bir şey olduğunda bana bidirmeyi yarıyor.
  }
}
