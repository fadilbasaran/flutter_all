// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/widget/button/answer_button.dart';
import 'package:flutter_full_learn/product/widget/button/loading_button.dart';

import '../product/widget/callback_dropdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallBackDropDown(
            onUserSelected: (CallBackUser user) {
              print(user);
            },
          ),
          AnswerButton(onNumber: (number) {
            return number % 3 == 1;
          }),
          LoadingButton(
              title: 'Save',
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 2));
              })
        ],
      ),
    );
  }
}

class CallBackUser {
  final String name;
  final int id;

  CallBackUser(this.name, this.id);

  static List<CallBackUser> dummyUser() {
    return [
      CallBackUser('Fb', 123),
      CallBackUser('Fb1', 1234),
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallBackUser && other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
