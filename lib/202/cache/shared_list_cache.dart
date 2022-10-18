import 'package:flutter/material.dart';

import 'shared_learn_cache_view.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({super.key});

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends State<SharedListCache> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _UserListView(),
    );
  }
}

class _UserListView extends StatelessWidget {
  _UserListView({
    Key? key,
  }) : super(key: key);

  final List<User> users = UserItems().users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(users[index].name),
            subtitle: Text(users[index].descriptoin),
            trailing: Text(
              users[index].url,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  decoration: TextDecoration.underline, color: Colors.blue),
            ),
          ),
        );
      },
    );
  }
}
