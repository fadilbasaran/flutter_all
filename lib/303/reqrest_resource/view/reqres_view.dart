// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/image_learn.dart';
import 'package:flutter_full_learn/303/reqrest_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/303/reqrest_resource/viewModel/reqres_provider.dart';
import 'package:flutter_full_learn/product/extension/string_extantion.dart';
import 'package:flutter_full_learn/product/global/resource_contex.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
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
  ///Birden çok defa dinlemek için watch() kullanılır.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqresProvider>(
      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Text(context.watch<ThemeNotifer>().themeName),
            onPressed: () {
              context.read<ThemeNotifer>().changeTheme();
              context.read<ThemeNotifer>().changeName();
            },
          ),
          appBar: AppBar(
              // ignore: prefer_const_literals_to_create_immutables
              actions: [
                const SaveAndNavigateWidget()
              ],
              title: context.watch<ReqresProvider>().isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : null),
          body: Column(
            children: [
              _TempPlaceHolder(),
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

  Selector<ReqresProvider, bool> _TempPlaceHolder() {
    return Selector<ReqresProvider, bool>(builder: (context, value, child) {
              return value
                  ? const Placeholder()
                  : const Text('Gitti canım Placeholder');
            }, selector: (contex, provider) {
              return provider.isLoading;
            });
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

class SaveAndNavigateWidget extends StatelessWidget {
  const SaveAndNavigateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context
            .read<ReqresProvider>()
            .saveToLocale(context.read<ResourceContext>(),context.read<ReqresProvider>().resource);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>const ImageLearn(),
        ));
      },
      icon: const Icon(Icons.generating_tokens),
    );
  }
}
