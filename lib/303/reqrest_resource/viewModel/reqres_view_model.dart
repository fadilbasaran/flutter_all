import 'package:flutter_full_learn/202/cache/shared_learn_cache_view.dart';
import 'package:flutter_full_learn/303/reqrest_resource/model/resource_model.dart';
import 'package:flutter_full_learn/303/reqrest_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/product/service/project_dio.dart';

import '../view/reqres_view.dart';

abstract class ReqresViewModel extends LoadingStatefull<ReqResView>
    with ProjectDioMixin {
  late final IReqresService reqresService;
  List<Data> resource = [];
  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(service);
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resource = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}
