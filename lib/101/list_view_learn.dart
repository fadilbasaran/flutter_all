import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({Key? key}) : super(key: key);

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            FittedBox(
              child: Text(
                'MERHABA',
                style: Theme.of(context).textTheme.displayLarge,
                maxLines: 1,
              ),
            ),
            Container(height: 300, color: Colors.yellow),
            const Divider(),
            SizedBox(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(width: 100, color: Colors.blue),
                  Container(width: 100, color: Colors.yellow),
                  Container(width: 100, color: Colors.blue),
                  Container(width: 100, color: Colors.yellow),
                  Container(width: 100, color: Colors.blue),
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
            const Placeholder(),
            const StafullTestingInit(),
          ],
        ));
  }
}

class StafullTestingInit extends StatefulWidget {
  const StafullTestingInit({Key? key}) : super(key: key);

  @override
  State<StafullTestingInit> createState() => _StafullTestingInitState();
}

class _StafullTestingInitState extends State<StafullTestingInit> {
  @override
  void initState() {
    super.initState();
    //print('Created');
  }

  @override
  void dispose() {
    super.dispose();
    //print('exit');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      height: 300,
    );
  }
}
