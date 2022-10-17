import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _manager;
  late final List<User> userItems;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    _initialze();
    userItems = UserItems().users;
  }

  void _onCahangeValue(String valueS) {
    final value = int.tryParse(valueS);

    if (value != null) {
      setState(() {
        _currentValue = value;
      });
    }
  }

  Future<void> _initialze() async {
    changeLoading();
    await _manager.init();
    changeLoading();
    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    _onCahangeValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          _removeValue(),
        ],
      ),
      appBar: AppBar(
        actions: [_loading(context)],
        title: Text(_currentValue.toString()),
      ),
      body: Column(
        children: [
          TextField(onChanged: _onCahangeValue),
          Expanded(child: _UserListView()),
        ],
      ),
    );
  }

  Center _loading(BuildContext context) {
    return Center(
        child: isLoading
            ? CircularProgressIndicator(
                color: Theme.of(context).backgroundColor,
              )
            : const SizedBox.shrink());
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading();
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        changeLoading();
      },
      child: const Icon(Icons.save),
    );
  }

  FloatingActionButton _removeValue() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading();
        await _manager.removeItem(SharedKeys.counter);
        changeLoading();
      },
      child: const Icon(Icons.remove),
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

class User {
  final String name;
  final String descriptoin;
  final String url;

  User(this.name, this.descriptoin, this.url);
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

//Generic
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;
  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
