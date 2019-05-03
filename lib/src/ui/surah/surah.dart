import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/gestures.dart';

import '../../blocs/single_surah/bloc.dart';
import '../../models/endpoint_models.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../common/mushaf_loader.dart';
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

  AudioPlayer _audio;
  String _url;
  @override
  void initState() {
    // Locale locale = Localizations.localeOf(context);
    // if (locale.languageCode == 'ar') {
    //   _url =
    //       'http://api.alquran.cloud/v1/surah/${widget.number}/ar.abdulbasitmurattal';
    // } else {
    //   _url = 'http://api.alquran.cloud/v1/surah/${widget.number}/en.ahmedali';
    // }
    // _singleSurahBloc.dispatch(Fetch(url: _url));
    _audio = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
    // _tapGestureRecognizer = TapGestureRecognizer()..onTap = _handleLongPress;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Locale locale = Localizations.localeOf(context);
    if (locale.languageCode == 'ar') {
      _url =
          'http://api.alquran.cloud/v1/surah/${widget.number}/ar.abdulbasitmurattal';
    } else {
      _url = 'http://api.alquran.cloud/v1/surah/${widget.number}/en.ahmedali';
    }
    _singleSurahBloc.dispatch(Fetch(url: _url));
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _singleSurahBloc.dispose();
    // if(_sound.)
    // _sound?.stopPlayer();
    super.dispose();
  }

  void _handleLongPress(String link) async {
    if (link != null) {
      if (_audio.state == AudioPlayerState.PLAYING) {
        await _audio.stop();
      }
      await _audio.play(link);
    }
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

  String replaceFarsiNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '٤', '٥', '٦', '۷', '۸', '۹'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], farsi[i]);
    }

    return input;
  }

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    return BlocBuilder(
      bloc: _singleSurahBloc,
      builder: (_, SingleSurahState state) {
        if (state is SingleSurahUninitialized) {
          return Scaffold(
            body: MushafLoader(),
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
                    locale.languageCode == 'ar'
                        ? state.surah.name
                        : state.surah.englishNameTranslation,
                    textScaleFactor: 1.5,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                body: ListView(
                  children: <Widget>[
                    StreamBuilder(
                      stream: _audio.onPlayerStateChanged,
                      builder: (_, AsyncSnapshot<AudioPlayerState> audioState) {
                        return StreamBuilder(
                          stream: _audio.onDurationChanged,
                          builder: (_, AsyncSnapshot<Duration> totalDuration) {
                            return StreamBuilder(
                              stream: _audio.onAudioPositionChanged,
                              builder: (_, AsyncSnapshot<Duration> progress) {
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
                                                    AudioPlayerState.PLAYING
                                                ? IconButton(
                                                    icon:
                                                        Icon(Icons.play_arrow),
                                                    onPressed:
                                                        audioState?.data !=
                                                                AudioPlayerState
                                                                    .PLAYING
                                                            ? () => _playSurah(
                                                                state.surah)
                                                            : null)
                                                : IconButton(
                                                    icon: Icon(Icons.pause),
                                                    onPressed: () async =>
                                                        await _audio.pause()),
                                            IconButton(
                                                icon: Icon(Icons.stop),
                                                onPressed: audioState?.data ==
                                                        AudioPlayerState.PLAYING
                                                    ? () async =>
                                                        await _audio.stop()
                                                    : null),
                                          ],
                                        ),
                                        !progress.hasData
                                            ? Container()
                                            : Text(
                                                '${progress.data.inHours} : ${progress.data.inMinutes} : ${progress.data.inSeconds} / ${totalDuration.data.inHours} : ${totalDuration.data.inMinutes} : ${totalDuration.data.inSeconds}  '),
                                        totalDuration.hasData &&
                                                audioState.data !=
                                                    AudioPlayerState.STOPPED
                                            ? Flexible(
                                                child: LinearProgressIndicator(
                                                  value: progress
                                                          .data.inMilliseconds /
                                                      totalDuration
                                                          .data.inMilliseconds,
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
                    ),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: locale.languageCode == 'ar'
                          ? Text('بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ')
                          : Text(
                              'In the name of Allah, most benevolent, ever-merciful.',
                              textScaleFactor: 0.7,
                              textAlign: TextAlign.center,
                            ),
                    )),
                    SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.all(12.0),
                        decoration:
                            BoxDecoration(border: Border.all(width: 2.0)),
                        padding: const EdgeInsets.all(20.0),
                        child: Text.rich(
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  _handleLongPress(state.surah.ayahs[0].audio),
                            text: '${state.surah.ayahs[0].text} ${state.surah.ayahs[0].numberInSurah} '
                                .replaceFirst(
                                    'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                                    '')
                                .replaceFirst('1', '')
                                .replaceFirst(
                                    'In the name of Allah, most benevolent, ever-merciful.',
                                    ''),
                            children: List.generate(
                              state.surah.ayahs.length - 1,
                              (int index) {
                                return TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => _handleLongPress(
                                          state.surah.ayahs[index + 1].audio),
                                    text:
                                        ' ${state.surah.ayahs[index + 1].text} ',
                                    children: [
                                      TextSpan(
                                          text: locale.languageCode == 'ar'
                                              ? replaceFarsiNumber(state
                                                  .surah
                                                  .ayahs[index + 1]
                                                  .numberInSurah
                                                  .toString())
                                              : ' ${state.surah.ayahs[index + 1].numberInSurah} ',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontFamily: 'Amiri'))
                                    ]);
                              },
                            ),
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ],
                ));
          }
        }
      },
    );
  }
}
