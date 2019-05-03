import 'package:meta/meta.dart';

abstract class SingleSurahEvent {}

class Fetch extends SingleSurahEvent {
  final String url;

  Fetch({@required this.url});
  @override
  String toString() => 'Fetch';
}
