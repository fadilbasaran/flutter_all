// ignore_for_file: unused_field

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';

class PostService {
  final Dio _dio;
  PostService()
      : _dio =
            Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  Future<bool> addToService(PostModelService postmodel) async {
    try {
      final response =
          await _dio.post(_PostServicePaths.posts.name, data: postmodel);
      return response.statusCode == HttpStatus.created;
    } catch (_) {}
    return false;
  }

  Future<List<PostModelService>?> fetchPostItemsAdvance() async {
    try {
      final response = await _dio.get(_PostServicePaths.posts.name);

      if (response.statusCode == HttpStatus.ok) {
        //İşlem başarılı mı
        final datas = response.data;
        if (datas is List) {
          return datas.map((e) => PostModelService.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print('hata varrr imdatt');
    }
    return null;
  }
}

enum _PostServicePaths { posts, comment }
