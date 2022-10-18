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

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    _initialze();
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

//Generic
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;
  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
