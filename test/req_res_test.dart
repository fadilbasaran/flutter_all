import 'package:dio/dio.dart';
import 'package:flutter_full_learn/303/reqrest_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/303/reqrest_resource/viewModel/reqres_provider.dart';
import 'package:flutter_full_learn/303/testable/user_save_model.dart';
import 'package:flutter_full_learn/product/global/resource_contex.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'req_res_test.mocks.dart';

@GenerateMocks([ReqresProvider])
void main() {
  setUp(() {
    Map<String, Object> values = <String, Object>{'fb': 'fadıl'};
    SharedPreferences.setMockInitialValues(values);
  });

  test('saveToLocal-Test', () {
    var mockProvider = ReqresProvider(ReqresService(Dio()));
    final resourceContext = ResourceContext();
    final result = mockProvider.saveToLocale(resourceContext, []);
    expect(result, []);
  });
  test('userTest-Test', () async {
    var useriewModel = UserSaveViewModel();
    final result =
        useriewModel.getReadData("fb", await SharedPreferences.getInstance());
    expect(result, true);
  });
}
