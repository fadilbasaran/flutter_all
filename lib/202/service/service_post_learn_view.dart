import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';

class ServiceLearnPost extends StatefulWidget {
  const ServiceLearnPost({super.key});

  @override
  State<ServiceLearnPost> createState() => _ServiceLearnPostState();
}

class _ServiceLearnPostState extends State<ServiceLearnPost> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();
  String? name;
  bool _isLoading = false;
  final _basUrl = 'https://jsonplaceholder.typicode.com/';
  late final Dio _networkManager;
  @override
  void initState() {
    super.initState();
    name = 'fadıl';
    _networkManager = Dio(BaseOptions(baseUrl: _basUrl));
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addToService(PostModelService postmodel) async {
    _changeLoading();
    final response = await _networkManager.post('posts', data: postmodel);
    if (response.statusCode == HttpStatus.created) {
      name = 'başarılı';
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? ''),
        actions: [
          _isLoading
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink()
        ],
      ),
      body: Column(children: [
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(labelText: 'Title'),
          textInputAction: TextInputAction.next,
        ),
        TextField(
          controller: _bodyController,
          decoration: const InputDecoration(labelText: 'body'),
        ),
        TextField(
          controller: _userIdController,
          autofillHints: const [AutofillHints.creditCardNumber],
          decoration: const InputDecoration(labelText: 'UserId'),
          keyboardType: TextInputType.number,
        ),
        TextButton(
            onPressed: _isLoading
                ? null
                : () {
                    if (_titleController.text.isNotEmpty &&
                        _bodyController.text.isNotEmpty &&
                        _userIdController.text.isNotEmpty) {
                      final postmodel = PostModelService(
                        body: _bodyController.text,
                        title: _titleController.text,
                        postId: int.tryParse(_userIdController.text),
                      );
                      _addToService(postmodel);
                    }
                  },
            child: const Text('Send'))
      ]),
    );
  }
}
