// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_meta_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAudioMetaDataCollection on Isar {
  IsarCollection<AudioMetaData> get audios_metas => this.collection();
}

const AudioMetaDataSchema = CollectionSchema(
  name: r'AudioMetaData',
  id: -6189426439028086099,
  properties: {
    r'audioName': PropertySchema(
      id: 0,
      name: r'audioName',
      type: IsarType.string,
    ),
    r'durationInSeconds': PropertySchema(
      id: 1,
      name: r'durationInSeconds',
      type: IsarType.long,
    ),
    r'enabled': PropertySchema(
      id: 2,
      name: r'enabled',
      type: IsarType.bool,
    ),
    r'fileName': PropertySchema(
      id: 3,
      name: r'fileName',
      type: IsarType.string,
    ),
    r'fileNameValue': PropertySchema(
      id: 4,
      name: r'fileNameValue',
      type: IsarType.string,
    ),
    r'handlerId': PropertySchema(
      id: 5,
      name: r'handlerId',
      type: IsarType.string,
    ),
    r'handlerIdValue': PropertySchema(
      id: 6,
      name: r'handlerIdValue',
      type: IsarType.string,
    ),
    r'isEnabled': PropertySchema(
      id: 7,
      name: r'isEnabled',
      type: IsarType.bool,
    )
  },
  estimateSize: _audioMetaDataEstimateSize,
  serialize: _audioMetaDataSerialize,
  deserialize: _audioMetaDataDeserialize,
  deserializeProp: _audioMetaDataDeserializeProp,
  idName: r'id',
  indexes: {
    r'fileNameValue': IndexSchema(
      id: 6053952966564581758,
      name: r'fileNameValue',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'fileNameValue',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    ),
    r'handlerIdValue': IndexSchema(
      id: -2984818347813308568,
      name: r'handlerIdValue',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'handlerIdValue',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _audioMetaDataGetId,
  getLinks: _audioMetaDataGetLinks,
  attach: _audioMetaDataAttach,
  version: '3.0.5',
);

int _audioMetaDataEstimateSize(
  AudioMetaData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.audioName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.fileName.length * 3;
  {
    final value = object.fileNameValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.handlerId.length * 3;
  {
    final value = object.handlerIdValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _audioMetaDataSerialize(
  AudioMetaData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.audioName);
  writer.writeLong(offsets[1], object.durationInSeconds);
  writer.writeBool(offsets[2], object.enabled);
  writer.writeString(offsets[3], object.fileName);
  writer.writeString(offsets[4], object.fileNameValue);
  writer.writeString(offsets[5], object.handlerId);
  writer.writeString(offsets[6], object.handlerIdValue);
  writer.writeBool(offsets[7], object.isEnabled);
}

AudioMetaData _audioMetaDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AudioMetaData();
  object.audioName = reader.readStringOrNull(offsets[0]);
  object.durationInSeconds = reader.readLongOrNull(offsets[1]);
  object.fileNameValue = reader.readStringOrNull(offsets[4]);
  object.handlerIdValue = reader.readStringOrNull(offsets[6]);
  object.id = id;
  object.isEnabled = reader.readBoolOrNull(offsets[7]);
  return object;
}

P _audioMetaDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _audioMetaDataGetId(AudioMetaData object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _audioMetaDataGetLinks(AudioMetaData object) {
  return [];
}

void _audioMetaDataAttach(
    IsarCollection<dynamic> col, Id id, AudioMetaData object) {
  object.id = id;
}

extension AudioMetaDataQueryWhereSort
    on QueryBuilder<AudioMetaData, AudioMetaData, QWhere> {
  QueryBuilder<AudioMetaData, AudioMetaData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AudioMetaDataQueryWhere
    on QueryBuilder<AudioMetaData, AudioMetaData, QWhereClause> {
  QueryBuilder<AudioMetaData, AudioMetaData, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterWhereClause>
      fileNameValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fileNameValue',
        value: [null],
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterWhereClause>
      fileNameValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fileNameValue',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterWhereClause>
      fileNameValueEqualTo(String? fileNameValue) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fileNameValue',
        value: [fileNameValue],
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterWhereClause>
      fileNameValueNotEqualTo(String? fileNameValue) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fileNameValue',
              lower: [],
              upper: [fileNameValue],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fileNameValue',
              lower: [fileNameValue],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fileNameValue',
              lower: [fileNameValue],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fileNameValue',
              lower: [],
              upper: [fileNameValue],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterWhereClause>
      handlerIdValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'handlerIdValue',
        value: [null],
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterWhereClause>
      handlerIdValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'handlerIdValue',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterWhereClause>
      handlerIdValueEqualTo(String? handlerIdValue) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'handlerIdValue',
        value: [handlerIdValue],
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterWhereClause>
      handlerIdValueNotEqualTo(String? handlerIdValue) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'handlerIdValue',
              lower: [],
              upper: [handlerIdValue],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'handlerIdValue',
              lower: [handlerIdValue],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'handlerIdValue',
              lower: [handlerIdValue],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'handlerIdValue',
              lower: [],
              upper: [handlerIdValue],
              includeUpper: false,
            ));
      }
    });
  }
}

extension AudioMetaDataQueryFilter
    on QueryBuilder<AudioMetaData, AudioMetaData, QFilterCondition> {
  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      audioNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'audioName',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      audioNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'audioName',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      audioNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'audioName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      audioNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'audioName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      audioNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'audioName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      audioNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'audioName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      audioNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'audioName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      audioNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'audioName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      audioNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'audioName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      audioNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'audioName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      audioNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'audioName',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      audioNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'audioName',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      durationInSecondsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'durationInSeconds',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      durationInSecondsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'durationInSeconds',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      durationInSecondsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      durationInSecondsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      durationInSecondsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      durationInSecondsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationInSeconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      enabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enabled',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fileName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileName',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fileName',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fileNameValue',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fileNameValue',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileNameValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileNameValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileNameValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileNameValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fileNameValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fileNameValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fileNameValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fileNameValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileNameValue',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      fileNameValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fileNameValue',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handlerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'handlerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'handlerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'handlerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'handlerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'handlerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'handlerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'handlerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handlerId',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'handlerId',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'handlerIdValue',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'handlerIdValue',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handlerIdValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'handlerIdValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'handlerIdValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'handlerIdValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'handlerIdValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'handlerIdValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'handlerIdValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'handlerIdValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handlerIdValue',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      handlerIdValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'handlerIdValue',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      isEnabledIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isEnabled',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      isEnabledIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isEnabled',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      isEnabledEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isEnabled',
        value: value,
      ));
    });
  }
}

extension AudioMetaDataQueryObject
    on QueryBuilder<AudioMetaData, AudioMetaData, QFilterCondition> {}

extension AudioMetaDataQueryLinks
    on QueryBuilder<AudioMetaData, AudioMetaData, QFilterCondition> {}

extension AudioMetaDataQuerySortBy
    on QueryBuilder<AudioMetaData, AudioMetaData, QSortBy> {
  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> sortByAudioName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioName', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      sortByAudioNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioName', Sort.desc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      sortByDurationInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      sortByDurationInSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.desc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> sortByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> sortByEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.desc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> sortByFileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      sortByFileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.desc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      sortByFileNameValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileNameValue', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      sortByFileNameValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileNameValue', Sort.desc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> sortByHandlerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerId', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      sortByHandlerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerId', Sort.desc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      sortByHandlerIdValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerIdValue', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      sortByHandlerIdValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerIdValue', Sort.desc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> sortByIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      sortByIsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.desc);
    });
  }
}

extension AudioMetaDataQuerySortThenBy
    on QueryBuilder<AudioMetaData, AudioMetaData, QSortThenBy> {
  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> thenByAudioName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioName', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      thenByAudioNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioName', Sort.desc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      thenByDurationInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      thenByDurationInSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.desc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> thenByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> thenByEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.desc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> thenByFileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      thenByFileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.desc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      thenByFileNameValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileNameValue', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      thenByFileNameValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileNameValue', Sort.desc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> thenByHandlerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerId', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      thenByHandlerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerId', Sort.desc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      thenByHandlerIdValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerIdValue', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      thenByHandlerIdValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerIdValue', Sort.desc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> thenByIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      thenByIsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.desc);
    });
  }
}

extension AudioMetaDataQueryWhereDistinct
    on QueryBuilder<AudioMetaData, AudioMetaData, QDistinct> {
  QueryBuilder<AudioMetaData, AudioMetaData, QDistinct> distinctByAudioName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'audioName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QDistinct>
      distinctByDurationInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationInSeconds');
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QDistinct> distinctByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enabled');
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QDistinct> distinctByFileName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QDistinct> distinctByFileNameValue(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileNameValue',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QDistinct> distinctByHandlerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'handlerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QDistinct>
      distinctByHandlerIdValue({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'handlerIdValue',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QDistinct> distinctByIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isEnabled');
    });
  }
}

extension AudioMetaDataQueryProperty
    on QueryBuilder<AudioMetaData, AudioMetaData, QQueryProperty> {
  QueryBuilder<AudioMetaData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AudioMetaData, String?, QQueryOperations> audioNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'audioName');
    });
  }

  QueryBuilder<AudioMetaData, int?, QQueryOperations>
      durationInSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationInSeconds');
    });
  }

  QueryBuilder<AudioMetaData, bool, QQueryOperations> enabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enabled');
    });
  }

  QueryBuilder<AudioMetaData, String, QQueryOperations> fileNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileName');
    });
  }

  QueryBuilder<AudioMetaData, String?, QQueryOperations>
      fileNameValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileNameValue');
    });
  }

  QueryBuilder<AudioMetaData, String, QQueryOperations> handlerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'handlerId');
    });
  }

  QueryBuilder<AudioMetaData, String?, QQueryOperations>
      handlerIdValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'handlerIdValue');
    });
  }

  QueryBuilder<AudioMetaData, bool?, QQueryOperations> isEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isEnabled');
    });
  }
}
