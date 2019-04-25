import 'package:flutter/material.dart';
import '../../blocs/surah_list/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _surahListBloc,
      builder: (_, SurahListState state) {
        if (state is SurahListUninitialized) {
          return Center(
            child: CircularProgressIndicator(),
          );
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
                leading: Text('${state.surahsMeta[index].number}'),
                title: Text(state.surahsMeta[index].englishName),
              );
            },
          );
        }
      },
    );
  }
}
