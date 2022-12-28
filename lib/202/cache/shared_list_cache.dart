import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_learn_cache_view.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';
import 'package:flutter_full_learn/202/cache/user_cache/user_cache_manager.dart';
import 'package:flutter_full_learn/202/cache/user_model.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({super.key});

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends LoadingStatefull<SharedListCache> {
  List<User> userItems=[];
  late final UserCacheManger userCacheManger;

  @override
  void initState() {
    super.initState();

    initalazeAndSave();
  }

  Future<void> initalazeAndSave() async {
    changeLoading();
    final SharedManager manager = SharedManager();

    await manager.init();
    userCacheManger = UserCacheManger(manager);
    userItems = userCacheManger.getItems() ?? [];

    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: isLoading
            ? CircularProgressIndicator(
                color: Theme.of(context).scaffoldBackgroundColor)
            : null,
        actions: isLoading
            ? null
            : [
                IconButton(
                    onPressed: () async {
                      changeLoading();
                      await userCacheManger.saveItems(userItems);
                      changeLoading();
                    },
                    icon: const Icon(Icons.download_for_offline_outlined)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove_circle_outline_outlined)),
              ],
      ),
      body: _UserListView(users: userItems),
    );
  }
}

class _UserListView extends StatelessWidget {
  const _UserListView({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(users[index].name ?? ''),
            subtitle: Text(users[index].description ?? ''),
            trailing: Text(
              users[index].url ?? '',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  decoration: TextDecoration.underline, color: Colors.blue),
            ),
          ),
        );
      },
    );
  }
}

class UserItems {
  late final List<User> users;

  UserItems() {
    users = [
      User('fb', 'descriptoin', 'fb.dev'),
      User('fb1', 'descriptoin', 'fb.dev'),
      User('fb3', 'descriptoin', 'fb.dev'),
    ];
  }
}
