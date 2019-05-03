import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
// import './quran_universal.dart';
import './serializers.dart';
import 'package:dio/dio.dart';
import './endpoint_models.dart';

const String baseUrl = 'http://api.alquran.cloud/v1/quran/quran-uthmani';
const String surahEndPointUrl = 'http://api.alquran.cloud/v1/surah';

// Future<List<Surah>> getQuranUniversal() async {
//   final response = await http.get(Uri.parse(baseUrl));
//   final quranAsset = await rootBundle.loadString('assets/quran-uthmani.json');
//   QuranUniversal quranUniversal = serializers.deserializeWith(
//       QuranUniversal.serializer, json.decode(quranAsset));

//   return quranUniversal.data.surahs.map((Surah surah) => surah).toList();
// }

Future<List<SurahMeta>> getSurahsMeta() async {
  final response = await http.get(Uri.parse(surahEndPointUrl));

  // print(response.body.runtimeType);
  // print(response.body);
  SurahEndPoint surahEnd = serializers.deserializeWith(
      SurahEndPoint.serializer, json.decode(response.body));
  return surahEnd.data.map((SurahMeta suraMeta) => suraMeta).toList();
}

Future<Surah> getSingleSurah(String url) async {
  final response = await http.get((Uri.parse(url)));
  // print(response.body);
  SingleSurahData surahData = serializers.deserializeWith(
      SingleSurahData.serializer, json.decode(response.body));
  // print(surahData.data);
  return surahData.data;
}
