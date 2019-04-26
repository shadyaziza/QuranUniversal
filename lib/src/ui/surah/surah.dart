import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/single_surah/bloc.dart';

class SurahScreen extends StatefulWidget {
  final int number;

  const SurahScreen({Key key, @required this.number}) : super(key: key);
  @override
  _SurahScreenState createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  SingleSurahBloc _singleSurahBloc = SingleSurahBloc();

  @override
  void initState() {
    _singleSurahBloc.dispatch(Fetch(number: widget.number));

    super.initState();
  }

  @override
  void dispose() {
    _singleSurahBloc.dispose();
    super.dispose();
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
                  textScaleFactor: 1.8,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              body: Directionality(
                textDirection: TextDirection.rtl,
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(border: Border.all(width: 2.0)),
                    padding: const EdgeInsets.all(20.0),
                    child: Text.rich(
                      TextSpan(
                        text:
                            '${state.surah.ayahs[0].text} ${state.surah.ayahs[0].numberInSurah} ',
                        children: List.generate(
                          state.surah.ayahs.length - 1,
                          (int index) {
                            return TextSpan(
                                text:
                                    '${state.surah.ayahs[index].text} ${state.surah.ayahs[index].numberInSurah} ');
                          },
                        ),
                      ),
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ),
            );
          }
        }
      },
    );
  }
}
