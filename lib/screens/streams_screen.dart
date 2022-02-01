// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';

class StreamsScreen extends StatelessWidget {
  final String title;
  StreamsScreen({Key? key, required this.title}) : super(key: key);
  //step1: create streamController//
  final StreamController streamController = StreamController();

  void streamData() async {//step2: stream async function//
    streamController.stream.listen((data) {//step3: call stream listener//
      print(data);
    });

    for (var i = 0; i < 5; i++) {//fake stream data//
      streamController.add('You got a Message !');//add stream data/
      await Future.delayed(const Duration(seconds: 5), () {
        print('Got it');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              streamData();
            },
            child: const Text('ClickMe')),
      ),
    );
  }
}
