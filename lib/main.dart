import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './src/ui/home/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './src/locale/locales.dart';

void main() => runApp(Root());

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  Locale locale;

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
        Locale('ar', ''),
        Locale('en', ''),
      ],
      locale: locale,
      onGenerateTitle: (context) => AppLocalizations.of(context).title,
      theme: ThemeData(
          fontFamily: locale?.languageCode == 'ar' ? 'Amiri' : 'Montserrat',
          primarySwatch: Colors.cyan,
          // fontFamily: 'Hafs',
          textTheme: TextTheme(body1: TextStyle(fontSize: 22.0))),
      home: Builder(builder: (BuildContext context) {
        AppLocalizations locals = AppLocalizations.of(context);
        return Theme(
          data: ThemeData(
              primarySwatch: Colors.cyan,
              fontFamily:
                  locale?.languageCode == 'ar' ? 'Naskh' : 'Montserrat'),
          child: Scaffold(
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    color: Theme.of(context).accentColor,
                    child: Center(child: Text(locals.title)),
                  ),
                  Align(
                    heightFactor: 7.5,
                    alignment: locale?.languageCode == 'ar'
                        ? FractionalOffset.bottomLeft
                        : FractionalOffset.bottomRight,
                    child: Directionality(
                      textDirection: locale?.languageCode == 'ar'
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      child: ListTile(
                        title: Text(
                            locale?.languageCode == 'ar' ? 'English' : 'عربي'),
                        enabled: true,
                        onTap: () => setState(() {
                              locale = Locale(
                                  locale?.languageCode == 'ar' ? 'en' : 'ar',
                                  '');
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              title: Text(locals.title),
            ),
            body: HomePage(),
          ),
        );
      }),
    );
  }
}
