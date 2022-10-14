import 'package:flutter/material.dart';

class ServiceViewLearn extends StatefulWidget {
  const ServiceViewLearn({super.key});

  @override
  State<ServiceViewLearn> createState() => _ServiceViewLearnState();
}

class _ServiceViewLearnState extends State<ServiceViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return const Text('data');
        },
      ),
    );
  }
}
