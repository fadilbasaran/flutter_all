import 'dart:developer';

import 'package:flutter/material.dart';
import '../viewModel/reqres_view_model.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({super.key});

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

class _ReqResViewState extends ReqresViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading ? const CircularProgressIndicator() : null,
      ),
      body: ListView.builder(
        itemCount: resource.length,
        itemBuilder: (BuildContext context, int index) {
          inspect(resource[index]);
          return Card(child: Text(resource[index].name ?? ''));
        },
      ),
    );
  }
}
