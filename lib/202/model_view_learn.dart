// ignore_for_file: unused_local_variable, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/model_learn.dart';

class ModelViewLearn extends StatefulWidget {
  const ModelViewLearn({super.key});

  @override
  State<ModelViewLearn> createState() => _ModelViewLearnState();
}

class _ModelViewLearnState extends State<ModelViewLearn> {
  var user9 = PostModel8(body: 'a');

  @override
  void initState() {
    super.initState();
    final user1 = PostModel()
      ..body = 'degerş'
      ..id = 23;
    user1.body = 'doldr';

    final user2 = PostModel2(1, 2, 'a', 'b');
    user2.body = 'asda';

    // ignore: unused_local_variable
    final user3 = PostModel3(1, 2, 'a', 'b');
    //user3.body='sdad';//final oldüu için değiştirilemiyor
    final user4 = PostModel4(userId: 2, id: 1, title: 'title', body: 'body');
    // user4.body='as';//final oldüu için değiştirilemiyor

    final user5 = PostModel5(userId: 2, id: 3, title: 'title', body: 'body');
//user5.=====>>>Ulaşılamıyor veriablelarına çünkü private

    final user6 = PostModel6(userId: 2, id: 3, title: 'title', body: 'body');
    //aynı durumdan muzdarip
    final user7 = PostModel7();
    //Service çekiyorsan en mantıklı kullanım bu
    final user8 = PostModel8(body: 'a');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            user9.updateBody('null');
          });
        },
      ),
      appBar: AppBar(
        title: Text(user9.body ?? 'Not has any data'),
      ),
    );
  }
}
