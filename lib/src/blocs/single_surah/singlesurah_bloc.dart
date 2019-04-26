import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import './bloc.dart';
import '../../models/api.dart';

class SingleSurahBloc extends Bloc<SingleSurahEvent, SingleSurahState> {
  @override
  SingleSurahState get initialState => SingleSurahUninitialized();

  @override
  Stream<SingleSurahState> mapEventToState(
    SingleSurahEvent event,
  ) async* {
    if (event is Fetch) {
      try {
        if (currentState is SingleSurahUninitialized) {
          final singleSurah = await getSingleSurah(event.number);
          yield SingleSurahLoaded(surah: singleSurah);
          return;
        }
        if (currentState is SingleSurahLoaded) {
          yield SingleSurahLoaded(
              surah: (currentState as SingleSurahLoaded).surah);
        }
      } catch (e) {
        yield SingleSurahError(error: e);
      }
    }
  }

  @override
  Stream<SingleSurahState> transform(Stream<SingleSurahEvent> events,
      Stream<SingleSurahState> Function(SingleSurahEvent event) next) {
    // TODO: implement transform
    return super.transform(
        (events as Observable<SingleSurahEvent>).debounce(
          Duration(milliseconds: 500),
        ),
        next);
  }
}
