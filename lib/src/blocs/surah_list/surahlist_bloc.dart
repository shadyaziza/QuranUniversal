import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import './bloc.dart';
import '../../models/api.dart';

class SurahListBloc extends Bloc<SurahListEvent, SurahListState> {
  @override
  SurahListState get initialState => SurahListUninitialized();

  @override
  Stream<SurahListState> mapEventToState(
    SurahListEvent event,
  ) async* {
    if (event is Fetch) {
      try {
        if (currentState is SurahListUninitialized) {
          final surahList = await getSurahsMeta();
          yield SurahListLoaded(surahsMeta: surahList);
          return;
        }
        if (currentState is SurahListLoaded) {
          yield SurahListLoaded(
              surahsMeta: (currentState as SurahListLoaded).surahsMeta);
        }
      } catch (e) {
        yield SurahListError(error: e);
      }
    }
  }

  @override
  Stream<SurahListState> transform(Stream<SurahListEvent> events,
      Stream<SurahListState> Function(SurahListEvent event) next) {
    // TODO: implement transform
    return super.transform(
        (events as Observable<SurahListEvent>).debounce(
          Duration(milliseconds: 500),
        ),
        next);
  }
}
