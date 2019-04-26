import 'package:meta/meta.dart';

import '../../models/endpoint_models.dart';

abstract class SingleSurahState {
  SingleSurahState() : super();
}

class SingleSurahUninitialized extends SingleSurahState {
  @override
  String toString() => 'SingleSurahUninitialized';
}

class SingleSurahError extends SingleSurahState {
  final dynamic error;

  SingleSurahError({@required this.error});
  @override
  String toString() => 'SingleSurahError : $error';
}

class SingleSurahLoaded extends SingleSurahState {
  final Surah surah;

  SingleSurahLoaded({this.surah});
  @override
  String toString() => 'SingleSurahLoaded : $surah';
}
