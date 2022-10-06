import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({Key? key}) : super(key: key);
  final String _title = 'Welcome Learn';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: const Icon(Icons.chevron_left_sharp),
        leadingWidth: 30,
        automaticallyImplyLeading: false, //otomatik gelen back butonu olmasın
        systemOverlayStyle: SystemUiOverlayStyle.light,
        //actionsIconTheme: const IconThemeData(color: Colors.orange, size: 30),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu_rounded),
          ),
          const Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
