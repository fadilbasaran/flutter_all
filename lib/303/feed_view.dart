import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/post_service.dart';

import '../202/service/post_model.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView>
    with AutomaticKeepAliveClientMixin {
  final IPostService _postService = PostService();
  late final Future<List<PostModelService>?> _itemsFuture;

  @override
  void initState() {
    _itemsFuture = _postService.fetchPostItemsAdvance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (() {
        setState(() {});
      })),
      appBar: AppBar(),
      body: _FeedFutureBuilder(itemsFuture: _itemsFuture),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _FeedFutureBuilder extends StatelessWidget {
  const _FeedFutureBuilder({
    Key? key,
    required Future<List<PostModelService>?> itemsFuture,
  })  : _itemsFuture = itemsFuture,
        super(key: key);

  final Future<List<PostModelService>?> _itemsFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostModelService>?>(
      future: _itemsFuture,
      builder: (BuildContext context,
          AsyncSnapshot<List<PostModelService>?> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Placeholder();
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.active:
            return const Center(child: CircularProgressIndicator());

          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data?[index].body ?? ' '),
                    ),
                  );
                },
              );
            } else {
              return const Placeholder();
            }
        }
      },
    );
  }
}
