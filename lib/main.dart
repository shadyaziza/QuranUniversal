import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './src/ui/home/home.dart';

void main() => runApp(Root());

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          fontFamily: 'Hafs',
          textTheme: TextTheme(
              body1: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Quran Universal'),
          ),
          body: HomePage()),
    );
  }
}
