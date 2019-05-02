import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter_sound/flutter_sound.dart';
import 'package:rxdart/rxdart.dart';
import '../../blocs/single_surah/bloc.dart';
import '../../models/endpoint_models.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:audioplayer/audioplayer.dart';

class SurahScreen extends StatefulWidget {
  final int number;

  const SurahScreen({Key key, @required this.number}) : super(key: key);
  @override
  _SurahScreenState createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  SingleSurahBloc _singleSurahBloc = SingleSurahBloc();
  // TapGestureRecognizer _tapGestureRecognizer;
  FlutterSound _sound;
  AudioPlayer _audio;
  @override
  void initState() {
    _sound = FlutterSound();
    _singleSurahBloc.dispatch(Fetch(number: widget.number));
    _audio = AudioPlayer();
    // _tapGestureRecognizer = TapGestureRecognizer()..onTap = _handleLongPress;
    super.initState();
  }

  @override
  void dispose() {
    _singleSurahBloc.dispose();
    // if(_sound.)
    // _sound?.stopPlayer();
    super.dispose();
  }

  void _handleLongPress(String link) async {
    if (_audio.state == AudioPlayerState.PLAYING) {
      await _audio.stop();
    }
    await _audio.play(link);
  }

  Future<void> _playSurah(Surah surah) async {
    String surahNum;

    if (surah.number < 100 && surah.number >= 10) {
      surahNum = '0' + surah.number.toString();
    } else if (surah.number < 10) {
      surahNum = '00' + surah.number.toString();
    } else {
      surahNum = surah.number.toString();
    }
    if (_audio.state == AudioPlayerState.PLAYING) {
      await _audio.stop();
    }

    await _audio
        .play(
            'https://download.quranicaudio.com/quran/abdul_basit_murattal/$surahNum.mp3')
        .then((void _) {
      print('Surah ${surah.englishName} is playing');
    });
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
                      Directionality(
                          textDirection: TextDirection.ltr,
                          child: StreamBuilder(
                            stream: _audio.onPlayerStateChanged,
                            builder: (_,
                                AsyncSnapshot<AudioPlayerState> audioState) {
                              return StreamBuilder(
                                stream: _audio.onDurationChanged,
                                builder:
                                    (_, AsyncSnapshot<Duration> totalDuration) {
                                  return StreamBuilder(
                                    stream: _audio.onAudioPositionChanged,
                                    builder:
                                        (_, AsyncSnapshot<Duration> progress) {
                                      return Container(
                                        child: Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  audioState?.data !=
                                                          AudioPlayerState
                                                              .PLAYING
                                                      ? IconButton(
                                                          icon: Icon(
                                                              Icons.play_arrow),
                                                          onPressed: audioState
                                                                      ?.data !=
                                                                  AudioPlayerState
                                                                      .PLAYING
                                                              ? () => _playSurah(
                                                                  state.surah)
                                                              : null)
                                                      : IconButton(
                                                          icon:
                                                              Icon(Icons.pause),
                                                          onPressed: () async =>
                                                              await _audio
                                                                  .pause()),
                                                  IconButton(
                                                      icon: Icon(Icons.stop),
                                                      onPressed: audioState
                                                                  ?.data ==
                                                              AudioPlayerState
                                                                  .PLAYING
                                                          ? () async =>
                                                              await _audio
                                                                  .stop()
                                                          : null),
                                                ],
                                              ),
                                              !progress.hasData
                                                  ? Container()
                                                  : Text(
                                                      '${progress.data.inHours} : ${progress.data.inMinutes} : ${progress.data.inSeconds} / ${totalDuration.data.inHours} : ${totalDuration.data.inMinutes} : ${totalDuration.data.inSeconds}  '),
                                              totalDuration.hasData &&
                                                      audioState.data !=
                                                          AudioPlayerState
                                                              .STOPPED
                                                  ? Flexible(
                                                      child:
                                                          LinearProgressIndicator(
                                                        value: progress.data
                                                                .inMilliseconds /
                                                            totalDuration.data
                                                                .inMilliseconds,
                                                      ),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          )),
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
                                ..onTap = () => _handleLongPress(
                                    state.surah.ayahs[0].audio),
                              text: '${state.surah.ayahs[0].text} ${state.surah.ayahs[0].numberInSurah} '
                                  .replaceFirst(
                                      'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                                      ''),
                              children: List.generate(
                                state.surah.ayahs.length - 1,
                                (int index) {
                                  return TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => _handleLongPress(
                                            state.surah.ayahs[index + 1].audio),
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
