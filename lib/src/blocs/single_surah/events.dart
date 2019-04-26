import 'package:meta/meta.dart';

abstract class SingleSurahEvent {}

class Fetch extends SingleSurahEvent {
  final int number;

  Fetch({@required this.number});
  @override
  String toString() => 'Fetch';
}
