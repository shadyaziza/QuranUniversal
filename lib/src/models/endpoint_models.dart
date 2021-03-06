import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

part 'endpoint_models.g.dart';

abstract class SingleSurahData
    implements Built<SingleSurahData, SingleSurahDataBuilder> {
  Surah get data;

  SingleSurahData._();

  static Serializer<SingleSurahData> get serializer =>
      _$singleSurahDataSerializer;
  factory SingleSurahData([void Function(SingleSurahDataBuilder) updates]) =
      _$SingleSurahData;
}

abstract class Surah implements Built<Surah, SurahBuilder> {
  int get number;
  String get name;
  String get englishName;
  String get englishNameTranslation;
  String get revelationType;
  int get numberOfAyahs;
  BuiltList<Ayah> get ayahs;

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
  @nullable
  String get audio;
  JsonObject get sajda;
  Ayah._();
  static Serializer<Ayah> get serializer => _$ayahSerializer;
  factory Ayah([void Function(AyahBuilder) updates]) = _$Ayah;
}
// abstract class AyahAudio implements Built<AyahAudio, AyahAudioBuilder> {
//   int get number;
//   int get numberInSurah;
//   int get juz;
//   int get manzil;
//   int get page;
//   int get ruku;
//   int get hizbQuarter;
//   String get text;
//   String get audio;
//   JsonObject get sajda;
//   AyahAudio._();
//   static Serializer<AyahAudio> get serializer => _$ayahAudioSerializer;
//   factory AyahAudio([void Function(AyahAudioBuilder) updates]) = _$AyahAudio;
// }

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
