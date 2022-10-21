
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/reqrest_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/303/reqrest_resource/viewModel/reqres_provider.dart';
import 'package:flutter_full_learn/product/service/project_dio.dart';
import 'package:provider/provider.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({super.key});

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

//class _ReqResViewState extends ReqresViewModel {
class _ReqResViewState extends State<ReqResView> with ProjectDioMixin{


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqresProvider>(
      builder: (context, child) {
        return const Scaffold(
          // appBar: AppBar(
          //   title: isLoading ? const CircularProgressIndicator() : null,
          // ),
          // body: ListView.builder(
          //   itemCount: resource.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     inspect(resource[index]);
          //     return Card(
          //         color: Color(resource[index].color?.colorValue ?? 0),
          //         child: Text(resource[index].name ?? ''));
          //   },
          // ),
        );
      }, create:(context) => ReqresProvider(ReqresService(service)),
    );
  }
}
