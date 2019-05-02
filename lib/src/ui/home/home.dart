import 'package:flutter/material.dart';
import '../../blocs/surah_list/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../surah/surah.dart';
import '../../locale/locales.dart';

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
    return BlocBuilder(
      bloc: _surahListBloc,
      builder: (_, SurahListState state) {
        if (state is SurahListUninitialized) {
          return Scaffold(
            appBar: AppBar(
              title: Text(locals.title),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is SurahListError) {
          return Scaffold(
            body: Center(
              child: Text(
                  'Unable to fetch the list of surahs, please check your internet connection.'),
            ),
          );
        }
        if (state is SurahListLoaded) {
          if (state.surahsMeta.isEmpty) {
            return Scaffold(
              appBar: AppBar(
                title: Text(locals.title),
              ),
              body: Center(
                child: Text('No Surahs'),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(locals.title),
            ),
            body: ListView.builder(
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
                  leading: Text('${state.surahsMeta[index].number}'),
                  title: Text(state.surahsMeta[index].englishName),
                );
              },
            ),
          );
        }
      },
    );
  }
}
