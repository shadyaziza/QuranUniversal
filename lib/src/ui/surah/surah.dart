import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter_sound/flutter_sound.dart';
import '../../blocs/single_surah/bloc.dart';

class SurahScreen extends StatefulWidget {
  final int number;

  const SurahScreen({Key key, @required this.number}) : super(key: key);
  @override
  _SurahScreenState createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  SingleSurahBloc _singleSurahBloc = SingleSurahBloc();
  TapGestureRecognizer _tapGestureRecognizer;
  FlutterSound _sound;
  @override
  void initState() {
    _sound = FlutterSound();
    _singleSurahBloc.dispatch(Fetch(number: widget.number));
    // _tapGestureRecognizer = TapGestureRecognizer()..onTap = _handleLongPress;
    super.initState();
  }

  @override
  void dispose() {
    _singleSurahBloc.dispose();
    _sound.stopPlayer();
    super.dispose();
  }

  void _handleLongPress() async {
    await _sound.startPlayer(
        'http://cdn.alquran.cloud/media/audio/ayah/ar.abdulbasitmurattal/6231');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _singleSurahBloc,
      builder: (_, SingleSurahState state) {
        if (state is SingleSurahUninitialized) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is SingleSurahError) {
          return Scaffold(
            body: Center(
              child: Text('Could not fetch surahhh'),
            ),
          );
        }
        if (state is SingleSurahLoaded) {
          if (state.surah == null) {
            return Scaffold(
              body: Center(
                child: Text('Could not fetch surah'),
              ),
            );
          } else {
            return Scaffold(
                appBar: AppBar(
                  iconTheme: Theme.of(context)
                      .iconTheme
                      .copyWith(color: Theme.of(context).primaryColor),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  centerTitle: true,
                  elevation: 0.0,
                  title: Text(
                    state.surah.name,
                    textScaleFactor: 1.5,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                body: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: IconButton(
                              icon: Icon(Icons.play_arrow),
                              onPressed: () {},
                            ),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(50.0)),
                          ),
                        ],
                      ),
                      Center(
                          child:
                              Text('بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ')),
                      SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.all(12.0),
                          decoration:
                              BoxDecoration(border: Border.all(width: 2.0)),
                          padding: const EdgeInsets.all(20.0),
                          child: Text.rich(
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = _handleLongPress,
                              text: '${state.surah.ayahs[0].text} ${state.surah.ayahs[0].numberInSurah} '
                                  .replaceFirst(
                                      'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                                      ''),
                              children: List.generate(
                                state.surah.ayahs.length - 1,
                                (int index) {
                                  return TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = _handleLongPress,
                                      text:
                                          '${state.surah.ayahs[index + 1].text}',
                                      children: [
                                        TextSpan(
                                            text:
                                                ' ${state.surah.ayahs[index + 1].numberInSurah} ',
                                            style: TextStyle(color: Colors.red))
                                      ]);
                                },
                              ),
                            ),
                            textAlign: TextAlign.start,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          }
        }
      },
    );
  }
}
