import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';
import 'package:flutter_full_learn/202/service/post_service.dart';

class ServiceViewLearn extends StatefulWidget {
  const ServiceViewLearn({super.key});

  @override
  State<ServiceViewLearn> createState() => _ServiceViewLearnState();
}

class _ServiceViewLearnState extends State<ServiceViewLearn> {
  List<PostModelService>? _items;
  late final IPostService _postService;
  String? name;
  bool _isLoading = false;
  final _basUrl = 'https://jsonplaceholder.typicode.com/';
  late final Dio _networkManager;
  @override
  void initState() {
    super.initState();
    name = 'fadıl';
    _networkManager = Dio(BaseOptions(baseUrl: _basUrl));
    fetchPostItems();
    _postService = PostService();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItems() async {
    _changeLoading();
    final response = await _networkManager.get('posts');
    if (response.statusCode == HttpStatus.ok) {
      //İşlem başarılı mı
      final datas = response.data;
      if (datas is List) {
        setState(() {
          _items = datas.map((e) => PostModelService.fromJson(e)).toList();
        });
      }
    }
    _changeLoading();
  }

  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    _items = await _postService.fetchPostItemsAdvance();
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _isLoading
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink()
        ],
        title: Text(name ?? ' '),
      ),
      body: _isLoading
          ? null
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              itemCount: _items?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return _PostCard(model: _items?[index]);
              },
            ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required PostModelService? model,
  })  : _model = model,
        super(key: key);

  final PostModelService? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
          title: Text(_model?.title ?? ''), subtitle: Text(_model?.body ?? '')),
    );
  }
}
