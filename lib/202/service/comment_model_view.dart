import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/comment_model.dart';
import 'package:flutter_full_learn/202/service/post_service.dart';

class CommentServiceView extends StatefulWidget {
  const CommentServiceView({super.key, this.postId});
  final int? postId;

  @override
  State<CommentServiceView> createState() => _CommentServiceViewState();
}

class _CommentServiceViewState extends State<CommentServiceView> {
  late final IPostService postService;
  List<CommentModel>? _commentsItem;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    postService = PostService();
    fetchItemWithID(widget.postId ?? 0);
  }

  Future<void> fetchItemWithID(int postId) async {
    _changeLoading();

    _commentsItem = await postService.fetchReleatedCommentWithPostId(postId);
    _changeLoading();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _commentsItem?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Text(_commentsItem?[index].email ?? 'yok bişey'),
          );
        },
      ),
    );
  }
}
