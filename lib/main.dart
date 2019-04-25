import 'package:flutter/material.dart';
import './src/ui/home/home.dart';

void main() => runApp(Root());

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          fontFamily: 'Hafs',
          textTheme: TextTheme(
              body1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold))),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Quran Universal'),
          ),
          body: HomePage()),
    );
  }
}
