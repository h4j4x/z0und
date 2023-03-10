// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_source_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAudioSourceDataCollection on Isar {
  IsarCollection<AudioSourceData> get audios_sources => this.collection();
}

const AudioSourceDataSchema = CollectionSchema(
  name: r'AudioSourceData',
  id: 189891329857771972,
  properties: {
    r'audioMetaId': PropertySchema(
      id: 0,
      name: r'audioMetaId',
      type: IsarType.long,
    ),
    r'expiresAt': PropertySchema(
      id: 1,
      name: r'expiresAt',
      type: IsarType.dateTime,
    ),
    r'expiresAtMillis': PropertySchema(
      id: 2,
      name: r'expiresAtMillis',
      type: IsarType.long,
    ),
    r'source': PropertySchema(
      id: 3,
      name: r'source',
      type: IsarType.string,
    ),
    r'sourceType': PropertySchema(
      id: 4,
      name: r'sourceType',
      type: IsarType.string,
      enumMap: _AudioSourceDatasourceTypeEnumValueMap,
    ),
    r'sourceTypeValue': PropertySchema(
      id: 5,
      name: r'sourceTypeValue',
      type: IsarType.string,
      enumMap: _AudioSourceDatasourceTypeValueEnumValueMap,
    ),
    r'sourceValue': PropertySchema(
      id: 6,
      name: r'sourceValue',
      type: IsarType.string,
    )
  },
  estimateSize: _audioSourceDataEstimateSize,
  serialize: _audioSourceDataSerialize,
  deserialize: _audioSourceDataDeserialize,
  deserializeProp: _audioSourceDataDeserializeProp,
  idName: r'id',
  indexes: {
    r'audioMetaId': IndexSchema(
      id: 1040598883410261217,
      name: r'audioMetaId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'audioMetaId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'expiresAtMillis': IndexSchema(
      id: 1434748628144529471,
      name: r'expiresAtMillis',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'expiresAtMillis',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _audioSourceDataGetId,
  getLinks: _audioSourceDataGetLinks,
  attach: _audioSourceDataAttach,
  version: '3.0.5',
);

int _audioSourceDataEstimateSize(
  AudioSourceData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.source.length * 3;
  bytesCount += 3 + object.sourceType.name.length * 3;
  {
    final value = object.sourceTypeValue;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.sourceValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _audioSourceDataSerialize(
  AudioSourceData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.audioMetaId);
  writer.writeDateTime(offsets[1], object.expiresAt);
  writer.writeLong(offsets[2], object.expiresAtMillis);
  writer.writeString(offsets[3], object.source);
  writer.writeString(offsets[4], object.sourceType.name);
  writer.writeString(offsets[5], object.sourceTypeValue?.name);
  writer.writeString(offsets[6], object.sourceValue);
}

AudioSourceData _audioSourceDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AudioSourceData();
  object.audioMetaId = reader.readLongOrNull(offsets[0]);
  object.expiresAtMillis = reader.readLongOrNull(offsets[2]);
  object.id = id;
  object.sourceTypeValue = _AudioSourceDatasourceTypeValueValueEnumMap[
      reader.readStringOrNull(offsets[5])];
  object.sourceValue = reader.readStringOrNull(offsets[6]);
  return object;
}

P _audioSourceDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (_AudioSourceDatasourceTypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          AudioSourceType.url) as P;
    case 5:
      return (_AudioSourceDatasourceTypeValueValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AudioSourceDatasourceTypeEnumValueMap = {
  r'url': r'url',
};
const _AudioSourceDatasourceTypeValueEnumMap = {
  r'url': AudioSourceType.url,
};
const _AudioSourceDatasourceTypeValueEnumValueMap = {
  r'url': r'url',
};
const _AudioSourceDatasourceTypeValueValueEnumMap = {
  r'url': AudioSourceType.url,
};

Id _audioSourceDataGetId(AudioSourceData object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _audioSourceDataGetLinks(AudioSourceData object) {
  return [];
}

void _audioSourceDataAttach(
    IsarCollection<dynamic> col, Id id, AudioSourceData object) {
  object.id = id;
}

extension AudioSourceDataQueryWhereSort
    on QueryBuilder<AudioSourceData, AudioSourceData, QWhere> {
  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhere> anyAudioMetaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'audioMetaId'),
      );
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhere>
      anyExpiresAtMillis() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'expiresAtMillis'),
      );
    });
  }
}

extension AudioSourceDataQueryWhere
    on QueryBuilder<AudioSourceData, AudioSourceData, QWhereClause> {
  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhereClause> idBetween(
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

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhereClause>
      audioMetaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'audioMetaId',
        value: [null],
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhereClause>
      audioMetaIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'audioMetaId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhereClause>
      audioMetaIdEqualTo(int? audioMetaId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'audioMetaId',
        value: [audioMetaId],
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhereClause>
      audioMetaIdNotEqualTo(int? audioMetaId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'audioMetaId',
              lower: [],
              upper: [audioMetaId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'audioMetaId',
              lower: [audioMetaId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'audioMetaId',
              lower: [audioMetaId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'audioMetaId',
              lower: [],
              upper: [audioMetaId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhereClause>
      audioMetaIdGreaterThan(
    int? audioMetaId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'audioMetaId',
        lower: [audioMetaId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhereClause>
      audioMetaIdLessThan(
    int? audioMetaId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'audioMetaId',
        lower: [],
        upper: [audioMetaId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhereClause>
      audioMetaIdBetween(
    int? lowerAudioMetaId,
    int? upperAudioMetaId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'audioMetaId',
        lower: [lowerAudioMetaId],
        includeLower: includeLower,
        upper: [upperAudioMetaId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhereClause>
      expiresAtMillisIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'expiresAtMillis',
        value: [null],
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhereClause>
      expiresAtMillisIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'expiresAtMillis',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhereClause>
      expiresAtMillisEqualTo(int? expiresAtMillis) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'expiresAtMillis',
        value: [expiresAtMillis],
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhereClause>
      expiresAtMillisNotEqualTo(int? expiresAtMillis) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'expiresAtMillis',
              lower: [],
              upper: [expiresAtMillis],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'expiresAtMillis',
              lower: [expiresAtMillis],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'expiresAtMillis',
              lower: [expiresAtMillis],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'expiresAtMillis',
              lower: [],
              upper: [expiresAtMillis],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhereClause>
      expiresAtMillisGreaterThan(
    int? expiresAtMillis, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'expiresAtMillis',
        lower: [expiresAtMillis],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhereClause>
      expiresAtMillisLessThan(
    int? expiresAtMillis, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'expiresAtMillis',
        lower: [],
        upper: [expiresAtMillis],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterWhereClause>
      expiresAtMillisBetween(
    int? lowerExpiresAtMillis,
    int? upperExpiresAtMillis, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'expiresAtMillis',
        lower: [lowerExpiresAtMillis],
        includeLower: includeLower,
        upper: [upperExpiresAtMillis],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AudioSourceDataQueryFilter
    on QueryBuilder<AudioSourceData, AudioSourceData, QFilterCondition> {
  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      audioMetaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'audioMetaId',
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      audioMetaIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'audioMetaId',
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      audioMetaIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'audioMetaId',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      audioMetaIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'audioMetaId',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      audioMetaIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'audioMetaId',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      audioMetaIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'audioMetaId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      expiresAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiresAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      expiresAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiresAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      expiresAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiresAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      expiresAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiresAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      expiresAtMillisIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expiresAtMillis',
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      expiresAtMillisIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expiresAtMillis',
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      expiresAtMillisEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiresAtMillis',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      expiresAtMillisGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiresAtMillis',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      expiresAtMillisLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiresAtMillis',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      expiresAtMillisBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiresAtMillis',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
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

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'source',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'source',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeEqualTo(
    AudioSourceType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeGreaterThan(
    AudioSourceType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeLessThan(
    AudioSourceType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeBetween(
    AudioSourceType lower,
    AudioSourceType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceType',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceType',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sourceTypeValue',
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sourceTypeValue',
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeValueEqualTo(
    AudioSourceType? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceTypeValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeValueGreaterThan(
    AudioSourceType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceTypeValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeValueLessThan(
    AudioSourceType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceTypeValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeValueBetween(
    AudioSourceType? lower,
    AudioSourceType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceTypeValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceTypeValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceTypeValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceTypeValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceTypeValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceTypeValue',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceTypeValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceTypeValue',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sourceValue',
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sourceValue',
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceValue',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterFilterCondition>
      sourceValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceValue',
        value: '',
      ));
    });
  }
}

extension AudioSourceDataQueryObject
    on QueryBuilder<AudioSourceData, AudioSourceData, QFilterCondition> {}

extension AudioSourceDataQueryLinks
    on QueryBuilder<AudioSourceData, AudioSourceData, QFilterCondition> {}

extension AudioSourceDataQuerySortBy
    on QueryBuilder<AudioSourceData, AudioSourceData, QSortBy> {
  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      sortByAudioMetaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioMetaId', Sort.asc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      sortByAudioMetaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioMetaId', Sort.desc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      sortByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.asc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      sortByExpiresAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.desc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      sortByExpiresAtMillis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAtMillis', Sort.asc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      sortByExpiresAtMillisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAtMillis', Sort.desc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy> sortBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      sortBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      sortBySourceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceType', Sort.asc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      sortBySourceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceType', Sort.desc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      sortBySourceTypeValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceTypeValue', Sort.asc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      sortBySourceTypeValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceTypeValue', Sort.desc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      sortBySourceValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceValue', Sort.asc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      sortBySourceValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceValue', Sort.desc);
    });
  }
}

extension AudioSourceDataQuerySortThenBy
    on QueryBuilder<AudioSourceData, AudioSourceData, QSortThenBy> {
  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      thenByAudioMetaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioMetaId', Sort.asc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      thenByAudioMetaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioMetaId', Sort.desc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      thenByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.asc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      thenByExpiresAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.desc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      thenByExpiresAtMillis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAtMillis', Sort.asc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      thenByExpiresAtMillisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAtMillis', Sort.desc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy> thenBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      thenBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      thenBySourceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceType', Sort.asc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      thenBySourceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceType', Sort.desc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      thenBySourceTypeValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceTypeValue', Sort.asc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      thenBySourceTypeValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceTypeValue', Sort.desc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      thenBySourceValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceValue', Sort.asc);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QAfterSortBy>
      thenBySourceValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceValue', Sort.desc);
    });
  }
}

extension AudioSourceDataQueryWhereDistinct
    on QueryBuilder<AudioSourceData, AudioSourceData, QDistinct> {
  QueryBuilder<AudioSourceData, AudioSourceData, QDistinct>
      distinctByAudioMetaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'audioMetaId');
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QDistinct>
      distinctByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiresAt');
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QDistinct>
      distinctByExpiresAtMillis() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiresAtMillis');
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QDistinct> distinctBySource(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'source', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QDistinct>
      distinctBySourceType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QDistinct>
      distinctBySourceTypeValue({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceTypeValue',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceData, QDistinct>
      distinctBySourceValue({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceValue', caseSensitive: caseSensitive);
    });
  }
}

extension AudioSourceDataQueryProperty
    on QueryBuilder<AudioSourceData, AudioSourceData, QQueryProperty> {
  QueryBuilder<AudioSourceData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AudioSourceData, int?, QQueryOperations> audioMetaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'audioMetaId');
    });
  }

  QueryBuilder<AudioSourceData, DateTime, QQueryOperations>
      expiresAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiresAt');
    });
  }

  QueryBuilder<AudioSourceData, int?, QQueryOperations>
      expiresAtMillisProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiresAtMillis');
    });
  }

  QueryBuilder<AudioSourceData, String, QQueryOperations> sourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'source');
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceType, QQueryOperations>
      sourceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceType');
    });
  }

  QueryBuilder<AudioSourceData, AudioSourceType?, QQueryOperations>
      sourceTypeValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceTypeValue');
    });
  }

  QueryBuilder<AudioSourceData, String?, QQueryOperations>
      sourceValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceValue');
    });
  }
}
