// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_universal.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<QuranUniversal> _$quranUniversalSerializer =
    new _$QuranUniversalSerializer();
Serializer<Data> _$dataSerializer = new _$DataSerializer();
Serializer<Surah> _$surahSerializer = new _$SurahSerializer();
Serializer<Ayah> _$ayahSerializer = new _$AyahSerializer();
Serializer<SurahEndPoint> _$surahEndPointSerializer =
    new _$SurahEndPointSerializer();
Serializer<Surahs> _$surahsSerializer = new _$SurahsSerializer();
Serializer<SurahMeta> _$surahMetaSerializer = new _$SurahMetaSerializer();

class _$QuranUniversalSerializer
    implements StructuredSerializer<QuranUniversal> {
  @override
  final Iterable<Type> types = const [QuranUniversal, _$QuranUniversal];
  @override
  final String wireName = 'QuranUniversal';

  @override
  Iterable serialize(Serializers serializers, QuranUniversal object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Data)),
    ];

    return result;
  }

  @override
  QuranUniversal deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuranUniversalBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(Data)) as Data);
          break;
      }
    }

    return result.build();
  }
}

class _$DataSerializer implements StructuredSerializer<Data> {
  @override
  final Iterable<Type> types = const [Data, _$Data];
  @override
  final String wireName = 'Data';

  @override
  Iterable serialize(Serializers serializers, Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'surahs',
      serializers.serialize(object.surahs,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Surah)])),
    ];

    return result;
  }

  @override
  Data deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'surahs':
          result.surahs.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Surah)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$SurahSerializer implements StructuredSerializer<Surah> {
  @override
  final Iterable<Type> types = const [Surah, _$Surah];
  @override
  final String wireName = 'Surah';

  @override
  Iterable serialize(Serializers serializers, Surah object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'ayahs',
      serializers.serialize(object.ayahs,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Ayah)])),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'englishName',
      serializers.serialize(object.englishName,
          specifiedType: const FullType(String)),
      'englishNameTranslation',
      serializers.serialize(object.englishNameTranslation,
          specifiedType: const FullType(String)),
      'revelationType',
      serializers.serialize(object.revelationType,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Surah deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SurahBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'ayahs':
          result.ayahs.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Ayah)]))
              as BuiltList);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'englishName':
          result.englishName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'englishNameTranslation':
          result.englishNameTranslation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'revelationType':
          result.revelationType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AyahSerializer implements StructuredSerializer<Ayah> {
  @override
  final Iterable<Type> types = const [Ayah, _$Ayah];
  @override
  final String wireName = 'Ayah';

  @override
  Iterable serialize(Serializers serializers, Ayah object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'number',
      serializers.serialize(object.number, specifiedType: const FullType(int)),
      'numberInSurah',
      serializers.serialize(object.numberInSurah,
          specifiedType: const FullType(int)),
      'juz',
      serializers.serialize(object.juz, specifiedType: const FullType(int)),
      'manzil',
      serializers.serialize(object.manzil, specifiedType: const FullType(int)),
      'page',
      serializers.serialize(object.page, specifiedType: const FullType(int)),
      'ruku',
      serializers.serialize(object.ruku, specifiedType: const FullType(int)),
      'hizbQuarter',
      serializers.serialize(object.hizbQuarter,
          specifiedType: const FullType(int)),
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Ayah deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AyahBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'numberInSurah':
          result.numberInSurah = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'juz':
          result.juz = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'manzil':
          result.manzil = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'page':
          result.page = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'ruku':
          result.ruku = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'hizbQuarter':
          result.hizbQuarter = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SurahEndPointSerializer implements StructuredSerializer<SurahEndPoint> {
  @override
  final Iterable<Type> types = const [SurahEndPoint, _$SurahEndPoint];
  @override
  final String wireName = 'SurahEndPoint';

  @override
  Iterable serialize(Serializers serializers, SurahEndPoint object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data,
          specifiedType:
              const FullType(BuiltList, const [const FullType(SurahMeta)])),
    ];

    return result;
  }

  @override
  SurahEndPoint deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SurahEndPointBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(SurahMeta)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$SurahsSerializer implements StructuredSerializer<Surahs> {
  @override
  final Iterable<Type> types = const [Surahs, _$Surahs];
  @override
  final String wireName = 'Surahs';

  @override
  Iterable serialize(Serializers serializers, Surahs object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  Surahs deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new SurahsBuilder().build();
  }
}

class _$SurahMetaSerializer implements StructuredSerializer<SurahMeta> {
  @override
  final Iterable<Type> types = const [SurahMeta, _$SurahMeta];
  @override
  final String wireName = 'SurahMeta';

  @override
  Iterable serialize(Serializers serializers, SurahMeta object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'number',
      serializers.serialize(object.number, specifiedType: const FullType(int)),
      'numberOfAyahs',
      serializers.serialize(object.numberOfAyahs,
          specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'englishName',
      serializers.serialize(object.englishName,
          specifiedType: const FullType(String)),
      'englishNameTranslation',
      serializers.serialize(object.englishNameTranslation,
          specifiedType: const FullType(String)),
      'revelationType',
      serializers.serialize(object.revelationType,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SurahMeta deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SurahMetaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'numberOfAyahs':
          result.numberOfAyahs = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'englishName':
          result.englishName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'englishNameTranslation':
          result.englishNameTranslation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'revelationType':
          result.revelationType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$QuranUniversal extends QuranUniversal {
  @override
  final Data data;

  factory _$QuranUniversal([void Function(QuranUniversalBuilder) updates]) =>
      (new QuranUniversalBuilder()..update(updates)).build();

  _$QuranUniversal._({this.data}) : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('QuranUniversal', 'data');
    }
  }

  @override
  QuranUniversal rebuild(void Function(QuranUniversalBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuranUniversalBuilder toBuilder() =>
      new QuranUniversalBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuranUniversal && data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('QuranUniversal')..add('data', data))
        .toString();
  }
}

class QuranUniversalBuilder
    implements Builder<QuranUniversal, QuranUniversalBuilder> {
  _$QuranUniversal _$v;

  DataBuilder _data;
  DataBuilder get data => _$this._data ??= new DataBuilder();
  set data(DataBuilder data) => _$this._data = data;

  QuranUniversalBuilder();

  QuranUniversalBuilder get _$this {
    if (_$v != null) {
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuranUniversal other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$QuranUniversal;
  }

  @override
  void update(void Function(QuranUniversalBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$QuranUniversal build() {
    _$QuranUniversal _$result;
    try {
      _$result = _$v ?? new _$QuranUniversal._(data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'QuranUniversal', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Data extends Data {
  @override
  final BuiltList<Surah> surahs;

  factory _$Data([void Function(DataBuilder) updates]) =>
      (new DataBuilder()..update(updates)).build();

  _$Data._({this.surahs}) : super._() {
    if (surahs == null) {
      throw new BuiltValueNullFieldError('Data', 'surahs');
    }
  }

  @override
  Data rebuild(void Function(DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataBuilder toBuilder() => new DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Data && surahs == other.surahs;
  }

  @override
  int get hashCode {
    return $jf($jc(0, surahs.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Data')..add('surahs', surahs))
        .toString();
  }
}

class DataBuilder implements Builder<Data, DataBuilder> {
  _$Data _$v;

  ListBuilder<Surah> _surahs;
  ListBuilder<Surah> get surahs => _$this._surahs ??= new ListBuilder<Surah>();
  set surahs(ListBuilder<Surah> surahs) => _$this._surahs = surahs;

  DataBuilder();

  DataBuilder get _$this {
    if (_$v != null) {
      _surahs = _$v.surahs?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Data other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Data;
  }

  @override
  void update(void Function(DataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Data build() {
    _$Data _$result;
    try {
      _$result = _$v ?? new _$Data._(surahs: surahs.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'surahs';
        surahs.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Surah extends Surah {
  @override
  final BuiltList<Ayah> ayahs;
  @override
  final String name;
  @override
  final String englishName;
  @override
  final String englishNameTranslation;
  @override
  final String revelationType;

  factory _$Surah([void Function(SurahBuilder) updates]) =>
      (new SurahBuilder()..update(updates)).build();

  _$Surah._(
      {this.ayahs,
      this.name,
      this.englishName,
      this.englishNameTranslation,
      this.revelationType})
      : super._() {
    if (ayahs == null) {
      throw new BuiltValueNullFieldError('Surah', 'ayahs');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Surah', 'name');
    }
    if (englishName == null) {
      throw new BuiltValueNullFieldError('Surah', 'englishName');
    }
    if (englishNameTranslation == null) {
      throw new BuiltValueNullFieldError('Surah', 'englishNameTranslation');
    }
    if (revelationType == null) {
      throw new BuiltValueNullFieldError('Surah', 'revelationType');
    }
  }

  @override
  Surah rebuild(void Function(SurahBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SurahBuilder toBuilder() => new SurahBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Surah &&
        ayahs == other.ayahs &&
        name == other.name &&
        englishName == other.englishName &&
        englishNameTranslation == other.englishNameTranslation &&
        revelationType == other.revelationType;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, ayahs.hashCode), name.hashCode),
                englishName.hashCode),
            englishNameTranslation.hashCode),
        revelationType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Surah')
          ..add('ayahs', ayahs)
          ..add('name', name)
          ..add('englishName', englishName)
          ..add('englishNameTranslation', englishNameTranslation)
          ..add('revelationType', revelationType))
        .toString();
  }
}

class SurahBuilder implements Builder<Surah, SurahBuilder> {
  _$Surah _$v;

  ListBuilder<Ayah> _ayahs;
  ListBuilder<Ayah> get ayahs => _$this._ayahs ??= new ListBuilder<Ayah>();
  set ayahs(ListBuilder<Ayah> ayahs) => _$this._ayahs = ayahs;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _englishName;
  String get englishName => _$this._englishName;
  set englishName(String englishName) => _$this._englishName = englishName;

  String _englishNameTranslation;
  String get englishNameTranslation => _$this._englishNameTranslation;
  set englishNameTranslation(String englishNameTranslation) =>
      _$this._englishNameTranslation = englishNameTranslation;

  String _revelationType;
  String get revelationType => _$this._revelationType;
  set revelationType(String revelationType) =>
      _$this._revelationType = revelationType;

  SurahBuilder();

  SurahBuilder get _$this {
    if (_$v != null) {
      _ayahs = _$v.ayahs?.toBuilder();
      _name = _$v.name;
      _englishName = _$v.englishName;
      _englishNameTranslation = _$v.englishNameTranslation;
      _revelationType = _$v.revelationType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Surah other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Surah;
  }

  @override
  void update(void Function(SurahBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Surah build() {
    _$Surah _$result;
    try {
      _$result = _$v ??
          new _$Surah._(
              ayahs: ayahs.build(),
              name: name,
              englishName: englishName,
              englishNameTranslation: englishNameTranslation,
              revelationType: revelationType);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'ayahs';
        ayahs.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Surah', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Ayah extends Ayah {
  @override
  final int number;
  @override
  final int numberInSurah;
  @override
  final int juz;
  @override
  final int manzil;
  @override
  final int page;
  @override
  final int ruku;
  @override
  final int hizbQuarter;
  @override
  final String text;

  factory _$Ayah([void Function(AyahBuilder) updates]) =>
      (new AyahBuilder()..update(updates)).build();

  _$Ayah._(
      {this.number,
      this.numberInSurah,
      this.juz,
      this.manzil,
      this.page,
      this.ruku,
      this.hizbQuarter,
      this.text})
      : super._() {
    if (number == null) {
      throw new BuiltValueNullFieldError('Ayah', 'number');
    }
    if (numberInSurah == null) {
      throw new BuiltValueNullFieldError('Ayah', 'numberInSurah');
    }
    if (juz == null) {
      throw new BuiltValueNullFieldError('Ayah', 'juz');
    }
    if (manzil == null) {
      throw new BuiltValueNullFieldError('Ayah', 'manzil');
    }
    if (page == null) {
      throw new BuiltValueNullFieldError('Ayah', 'page');
    }
    if (ruku == null) {
      throw new BuiltValueNullFieldError('Ayah', 'ruku');
    }
    if (hizbQuarter == null) {
      throw new BuiltValueNullFieldError('Ayah', 'hizbQuarter');
    }
    if (text == null) {
      throw new BuiltValueNullFieldError('Ayah', 'text');
    }
  }

  @override
  Ayah rebuild(void Function(AyahBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AyahBuilder toBuilder() => new AyahBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Ayah &&
        number == other.number &&
        numberInSurah == other.numberInSurah &&
        juz == other.juz &&
        manzil == other.manzil &&
        page == other.page &&
        ruku == other.ruku &&
        hizbQuarter == other.hizbQuarter &&
        text == other.text;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, number.hashCode),
                                numberInSurah.hashCode),
                            juz.hashCode),
                        manzil.hashCode),
                    page.hashCode),
                ruku.hashCode),
            hizbQuarter.hashCode),
        text.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Ayah')
          ..add('number', number)
          ..add('numberInSurah', numberInSurah)
          ..add('juz', juz)
          ..add('manzil', manzil)
          ..add('page', page)
          ..add('ruku', ruku)
          ..add('hizbQuarter', hizbQuarter)
          ..add('text', text))
        .toString();
  }
}

class AyahBuilder implements Builder<Ayah, AyahBuilder> {
  _$Ayah _$v;

  int _number;
  int get number => _$this._number;
  set number(int number) => _$this._number = number;

  int _numberInSurah;
  int get numberInSurah => _$this._numberInSurah;
  set numberInSurah(int numberInSurah) => _$this._numberInSurah = numberInSurah;

  int _juz;
  int get juz => _$this._juz;
  set juz(int juz) => _$this._juz = juz;

  int _manzil;
  int get manzil => _$this._manzil;
  set manzil(int manzil) => _$this._manzil = manzil;

  int _page;
  int get page => _$this._page;
  set page(int page) => _$this._page = page;

  int _ruku;
  int get ruku => _$this._ruku;
  set ruku(int ruku) => _$this._ruku = ruku;

  int _hizbQuarter;
  int get hizbQuarter => _$this._hizbQuarter;
  set hizbQuarter(int hizbQuarter) => _$this._hizbQuarter = hizbQuarter;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  AyahBuilder();

  AyahBuilder get _$this {
    if (_$v != null) {
      _number = _$v.number;
      _numberInSurah = _$v.numberInSurah;
      _juz = _$v.juz;
      _manzil = _$v.manzil;
      _page = _$v.page;
      _ruku = _$v.ruku;
      _hizbQuarter = _$v.hizbQuarter;
      _text = _$v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Ayah other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Ayah;
  }

  @override
  void update(void Function(AyahBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Ayah build() {
    final _$result = _$v ??
        new _$Ayah._(
            number: number,
            numberInSurah: numberInSurah,
            juz: juz,
            manzil: manzil,
            page: page,
            ruku: ruku,
            hizbQuarter: hizbQuarter,
            text: text);
    replace(_$result);
    return _$result;
  }
}

class _$SurahEndPoint extends SurahEndPoint {
  @override
  final BuiltList<SurahMeta> data;

  factory _$SurahEndPoint([void Function(SurahEndPointBuilder) updates]) =>
      (new SurahEndPointBuilder()..update(updates)).build();

  _$SurahEndPoint._({this.data}) : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('SurahEndPoint', 'data');
    }
  }

  @override
  SurahEndPoint rebuild(void Function(SurahEndPointBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SurahEndPointBuilder toBuilder() => new SurahEndPointBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SurahEndPoint && data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SurahEndPoint')..add('data', data))
        .toString();
  }
}

class SurahEndPointBuilder
    implements Builder<SurahEndPoint, SurahEndPointBuilder> {
  _$SurahEndPoint _$v;

  ListBuilder<SurahMeta> _data;
  ListBuilder<SurahMeta> get data =>
      _$this._data ??= new ListBuilder<SurahMeta>();
  set data(ListBuilder<SurahMeta> data) => _$this._data = data;

  SurahEndPointBuilder();

  SurahEndPointBuilder get _$this {
    if (_$v != null) {
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SurahEndPoint other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SurahEndPoint;
  }

  @override
  void update(void Function(SurahEndPointBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SurahEndPoint build() {
    _$SurahEndPoint _$result;
    try {
      _$result = _$v ?? new _$SurahEndPoint._(data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SurahEndPoint', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Surahs extends Surahs {
  factory _$Surahs([void Function(SurahsBuilder) updates]) =>
      (new SurahsBuilder()..update(updates)).build();

  _$Surahs._() : super._();

  @override
  Surahs rebuild(void Function(SurahsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SurahsBuilder toBuilder() => new SurahsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Surahs;
  }

  @override
  int get hashCode {
    return 48176981;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('Surahs').toString();
  }
}

class SurahsBuilder implements Builder<Surahs, SurahsBuilder> {
  _$Surahs _$v;

  SurahsBuilder();

  @override
  void replace(Surahs other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Surahs;
  }

  @override
  void update(void Function(SurahsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Surahs build() {
    final _$result = _$v ?? new _$Surahs._();
    replace(_$result);
    return _$result;
  }
}

class _$SurahMeta extends SurahMeta {
  @override
  final int number;
  @override
  final int numberOfAyahs;
  @override
  final String name;
  @override
  final String englishName;
  @override
  final String englishNameTranslation;
  @override
  final String revelationType;

  factory _$SurahMeta([void Function(SurahMetaBuilder) updates]) =>
      (new SurahMetaBuilder()..update(updates)).build();

  _$SurahMeta._(
      {this.number,
      this.numberOfAyahs,
      this.name,
      this.englishName,
      this.englishNameTranslation,
      this.revelationType})
      : super._() {
    if (number == null) {
      throw new BuiltValueNullFieldError('SurahMeta', 'number');
    }
    if (numberOfAyahs == null) {
      throw new BuiltValueNullFieldError('SurahMeta', 'numberOfAyahs');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('SurahMeta', 'name');
    }
    if (englishName == null) {
      throw new BuiltValueNullFieldError('SurahMeta', 'englishName');
    }
    if (englishNameTranslation == null) {
      throw new BuiltValueNullFieldError('SurahMeta', 'englishNameTranslation');
    }
    if (revelationType == null) {
      throw new BuiltValueNullFieldError('SurahMeta', 'revelationType');
    }
  }

  @override
  SurahMeta rebuild(void Function(SurahMetaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SurahMetaBuilder toBuilder() => new SurahMetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SurahMeta &&
        number == other.number &&
        numberOfAyahs == other.numberOfAyahs &&
        name == other.name &&
        englishName == other.englishName &&
        englishNameTranslation == other.englishNameTranslation &&
        revelationType == other.revelationType;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, number.hashCode), numberOfAyahs.hashCode),
                    name.hashCode),
                englishName.hashCode),
            englishNameTranslation.hashCode),
        revelationType.hashCode));
  }
}

class SurahMetaBuilder implements Builder<SurahMeta, SurahMetaBuilder> {
  _$SurahMeta _$v;

  int _number;
  int get number => _$this._number;
  set number(int number) => _$this._number = number;

  int _numberOfAyahs;
  int get numberOfAyahs => _$this._numberOfAyahs;
  set numberOfAyahs(int numberOfAyahs) => _$this._numberOfAyahs = numberOfAyahs;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _englishName;
  String get englishName => _$this._englishName;
  set englishName(String englishName) => _$this._englishName = englishName;

  String _englishNameTranslation;
  String get englishNameTranslation => _$this._englishNameTranslation;
  set englishNameTranslation(String englishNameTranslation) =>
      _$this._englishNameTranslation = englishNameTranslation;

  String _revelationType;
  String get revelationType => _$this._revelationType;
  set revelationType(String revelationType) =>
      _$this._revelationType = revelationType;

  SurahMetaBuilder();

  SurahMetaBuilder get _$this {
    if (_$v != null) {
      _number = _$v.number;
      _numberOfAyahs = _$v.numberOfAyahs;
      _name = _$v.name;
      _englishName = _$v.englishName;
      _englishNameTranslation = _$v.englishNameTranslation;
      _revelationType = _$v.revelationType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SurahMeta other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SurahMeta;
  }

  @override
  void update(void Function(SurahMetaBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SurahMeta build() {
    final _$result = _$v ??
        new _$SurahMeta._(
            number: number,
            numberOfAyahs: numberOfAyahs,
            name: name,
            englishName: englishName,
            englishNameTranslation: englishNameTranslation,
            revelationType: revelationType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
