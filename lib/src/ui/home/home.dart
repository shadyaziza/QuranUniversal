import 'package:flutter/material.dart';
import '../../blocs/surah_list/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../surah/surah.dart';
import '../../locale/locales.dart';
import '../../common/common.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SurahListBloc _surahListBloc = SurahListBloc();
  _HomePageState() {
    _surahListBloc.dispatch(Fetch());
  }
  @override
  void dispose() {
    _surahListBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations locals = AppLocalizations.of(context);
    Locale locale = Localizations.localeOf(context);

    return BlocBuilder(
      bloc: _surahListBloc,
      builder: (_, SurahListState state) {
        if (state is SurahListUninitialized) {
          return MushafLoader();
        }
        if (state is SurahListError) {
          return Center(
            child: Text(
                'Unable to fetch the list of surahs, please check your internet connection.'),
          );
        }
        if (state is SurahListLoaded) {
          if (state.surahsMeta.isEmpty) {
            return Center(
              child: Text('No Surahs'),
            );
          }
          return ListView.builder(
            itemCount: state.surahsMeta.length,
            itemBuilder: (_, int index) {
              return ListTile(
                onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (_) => SurahScreen(
                                number: state.surahsMeta[index].number,
                              )),
                    ),
                // leading: Text(

                //   style: TextStyle(fontFamily: 'Amiri'),
                // ),
                title: Center(
                  child: Text(
                    locale.languageCode == 'ar'
                        ? replaceFarsiNumber(
                            '${state.surahsMeta[index].number}. ${state.surahsMeta[index].name}')
                        : '${state.surahsMeta[index].number}. ${state.surahsMeta[index].englishName}',
                    textAlign: TextAlign.left,
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  String replaceFarsiNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '٤', '٥', '٦', '۷', '۸', '۹'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], farsi[i]);
    }

    return input;
  }
}
