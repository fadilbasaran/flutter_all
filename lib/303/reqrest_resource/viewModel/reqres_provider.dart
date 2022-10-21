import 'package:flutter/widgets.dart';

import '../model/resource_model.dart';
import '../service/reqres_service.dart';

class ReqresProvider extends ChangeNotifier {
  late final IReqresService reqresService;
  List<Data> resource = [];
  bool isLoading = false;

  ReqresProvider(this.reqresService) {
    _fetch();
    _chnageLoading();
  }

  Future<void> _fetch() async {
    resource = (await reqresService.fetchResourceItem())?.data ?? [];
  }

  void _chnageLoading() {
    isLoading = !isLoading;
    notifyListeners();//Bu mtoda her hangi bir şey olduğunda bana bidirmeyi yarıyor
  }
}
