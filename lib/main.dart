import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './src/ui/home/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './src/locale/locales.dart';

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
        localizationsDelegates: [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [
          Locale('en', ''),
          Locale('ar', ''),
        ],
        locale: Locale('ar', ''),
        onGenerateTitle: (context) => AppLocalizations.of(context).title,
        theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            fontFamily: 'Hafs',
            textTheme: TextTheme(
                body1: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))),
        home: HomePage());
  }
}
