import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TomatoMessage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TomatoMessageState();
}

class TomatoMessageState extends State<TomatoMessage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tomato message'),
      ),
      body: Text(':))'),
    );
  }
}