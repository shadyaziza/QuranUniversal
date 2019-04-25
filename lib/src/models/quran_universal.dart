import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'quran_universal.g.dart';

abstract class QuranUniversal
    implements Built<QuranUniversal, QuranUniversalBuilder> {
  Data get data;
  QuranUniversal._();
  static Serializer<QuranUniversal> get serializer =>
      _$quranUniversalSerializer;
  factory QuranUniversal([void Function(QuranUniversalBuilder) updates]) =
      _$QuranUniversal;
}

abstract class Data implements Built<Data, DataBuilder> {
  BuiltList<Surah> get surahs;
  Data._();
  static Serializer<Data> get serializer => _$dataSerializer;
  factory Data([void Function(DataBuilder) updates]) = _$Data;
}

abstract class Surah implements Built<Surah, SurahBuilder> {
  BuiltList<Ayah> get ayahs;
  String get name;
  String get englishName;
  String get englishNameTranslation;
  String get revelationType;

  Surah._();

  static Serializer<Surah> get serializer => _$surahSerializer;
  factory Surah([void Function(SurahBuilder) updates]) = _$Surah;
}

abstract class Ayah implements Built<Ayah, AyahBuilder> {
  int get number;
  int get numberInSurah;
  int get juz;
  int get manzil;
  int get page;
  int get ruku;
  int get hizbQuarter;
  String get text;
  // bool get sajda;
  Ayah._();
  static Serializer<Ayah> get serializer => _$ayahSerializer;
  factory Ayah([void Function(AyahBuilder) updates]) = _$Ayah;
}

///For Surah End Point
abstract class SurahEndPoint
    implements Built<SurahEndPoint, SurahEndPointBuilder> {
  BuiltList<SurahMeta> get data;
  SurahEndPoint._();
  static Serializer<SurahEndPoint> get serializer => _$surahEndPointSerializer;
  factory SurahEndPoint([void Function(SurahEndPointBuilder) updates]) =
      _$SurahEndPoint;
}

abstract class Surahs implements Built<Surahs, SurahsBuilder> {
  // BuiltList<SurahMeta> get surahsMeta;
  // int get number;
  // int get numberOfAyahs;
  // String get name;
  // String get englishName;
  // String get englishNameTranslation;
  // String get revelationType;
  Surahs._();
  static Serializer<Surahs> get serializer => _$surahsSerializer;
  factory Surahs([void Function(SurahsBuilder) updates]) = _$Surahs;
}

abstract class SurahMeta implements Built<SurahMeta, SurahMetaBuilder> {
  int get number;
  int get numberOfAyahs;
  String get name;
  String get englishName;
  String get englishNameTranslation;
  String get revelationType;
  SurahMeta._();

  static Serializer<SurahMeta> get serializer => _$surahMetaSerializer;
  factory SurahMeta([void Function(SurahMetaBuilder) updates]) = _$SurahMeta;
  @override
  String toString() => '$number : $englishName';
  // @override
  // bool compareTo(SurahMeta other)=> other==this;
}
