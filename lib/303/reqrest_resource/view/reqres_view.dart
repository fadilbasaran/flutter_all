import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/reqrest_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/303/reqrest_resource/viewModel/reqres_provider.dart';
import 'package:flutter_full_learn/product/extension/string_extantion.dart';
import 'package:flutter_full_learn/product/service/project_dio.dart';
import 'package:provider/provider.dart';

import '../model/resource_model.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({super.key});

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

//class _ReqResViewState extends ReqresViewModel {
class _ReqResViewState extends State<ReqResView> with ProjectDioMixin {
  ///Sadece bi defa dinle read()
  ///Birden çok defa dinlemye is watch() kullanılır.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqresProvider>(
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
              title: context.watch<ReqresProvider>().isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : null),
          body: Column(
            children: [
              Selector<ReqresProvider, bool>(builder: (context, value, child) {
                return value? const Placeholder():const Text('Gitti canım Place holder');
              }, selector: (contex, provider) {
                return provider.isLoading;
              }),
              Expanded(
                child: _resourceListView(
                    context, context.watch<ReqresProvider>().resource),
              ),
            ],
          ),
        );
      },
      create: (context) => ReqresProvider(ReqresService(service)),
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            color: Color(items[index].color?.colorValue ?? 0),
            child: Text(items[index].name ?? ''));
      },
    );
  }
}
