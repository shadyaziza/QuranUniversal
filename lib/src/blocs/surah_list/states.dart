import 'package:meta/meta.dart';

import '../../models/quran_universal.dart';

abstract class SurahListState {
  SurahListState([List props = const []]) : super();
}

class SurahListUninitialized extends SurahListState {
  @override
  String toString() => 'SurahListUninitialized';
}

class SurahListError extends SurahListState {
  final dynamic error;

  SurahListError({@required this.error});
  @override
  String toString() => 'SurahListError : $error';
}

class SurahListLoaded extends SurahListState {
  final List<SurahMeta> surahsMeta;

  SurahListLoaded({this.surahsMeta});
  @override
  String toString() => 'SurahListLoaded : $surahsMeta';
}
