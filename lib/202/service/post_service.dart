// ignore_for_file: unused_field

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';

abstract class IPostService {
  Future<bool> addToService(PostModelService postmodel);
  Future<bool> putItemToService(PostModelService postmodel, int id);
  Future<bool> deleteItemToService(PostModelService postmodel, int id);
  Future<List<PostModelService>?> fetchPostItemsAdvance();
}

class PostService implements IPostService {
  final Dio _dio;
  PostService()
      : _dio =
            Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<bool> addToService(PostModelService postmodel) async {
    try {
      final response =
          await _dio.post(_PostServicePaths.posts.name, data: postmodel);
      return response.statusCode == HttpStatus.created;
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception);
    }
    return false;
  }

  @override
  Future<bool> putItemToService(PostModelService postmodel, int id) async {
    try {
      final response = await _dio.put('${_PostServicePaths.posts.name}/$id',
          data: postmodel);
      return response.statusCode == HttpStatus.created;
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception);
    }
    return false;
  }

  @override
  Future<bool> deleteItemToService(PostModelService postmodel, int id) async {
    try {
      final response = await _dio.delete('$id');
      return response.statusCode == HttpStatus.created;
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception);
    }
    return false;
  }

  @override
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
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception);
    }
    return null;
  }
}

enum _PostServicePaths { posts, comment }

class _ShowDebug {
  static void showDioError(DioError error) {
    if (kDebugMode) {
      print(error.message);
    }
  }
}
