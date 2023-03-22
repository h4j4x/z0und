// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_source_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetIsarAudioSourceCollection on Isar {
  IsarCollection<IsarAudioSource> get audios_sources => this.collection();
}

const IsarAudioSourceSchema = CollectionSchema(
  name: r'IsarAudioSource',
  id: 8542771333575320220,
  properties: {
    r'audioMetaId': PropertySchema(
      id: 0,
      name: r'audioMetaId',
      type: IsarType.long,
    ),
    r'expiresAtMillis': PropertySchema(
      id: 1,
      name: r'expiresAtMillis',
      type: IsarType.long,
    ),
    r'source': PropertySchema(
      id: 2,
      name: r'source',
      type: IsarType.string,
    ),
    r'sourceType': PropertySchema(
      id: 3,
      name: r'sourceType',
      type: IsarType.string,
      enumMap: _IsarAudioSourcesourceTypeEnumValueMap,
    )
  },
  estimateSize: _isarAudioSourceEstimateSize,
  serialize: _isarAudioSourceSerialize,
  deserialize: _isarAudioSourceDeserialize,
  deserializeProp: _isarAudioSourceDeserializeProp,
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
  getId: _isarAudioSourceGetId,
  getLinks: _isarAudioSourceGetLinks,
  attach: _isarAudioSourceAttach,
  version: '3.0.5',
);

int _isarAudioSourceEstimateSize(
  IsarAudioSource object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.source;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sourceType;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  return bytesCount;
}

void _isarAudioSourceSerialize(
  IsarAudioSource object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.audioMetaId);
  writer.writeLong(offsets[1], object.expiresAtMillis);
  writer.writeString(offsets[2], object.source);
  writer.writeString(offsets[3], object.sourceType?.name);
}

IsarAudioSource _isarAudioSourceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarAudioSource();
  object.audioMetaId = reader.readLongOrNull(offsets[0]);
  object.expiresAtMillis = reader.readLongOrNull(offsets[1]);
  object.id = id;
  object.source = reader.readStringOrNull(offsets[2]);
  object.sourceType = _IsarAudioSourcesourceTypeValueEnumMap[
      reader.readStringOrNull(offsets[3])];
  return object;
}

P _isarAudioSourceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (_IsarAudioSourcesourceTypeValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarAudioSourcesourceTypeEnumValueMap = {
  r'url': r'url',
  r'file': r'file',
};
const _IsarAudioSourcesourceTypeValueEnumMap = {
  r'url': AudioSourceType.url,
  r'file': AudioSourceType.file,
};

Id _isarAudioSourceGetId(IsarAudioSource object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarAudioSourceGetLinks(IsarAudioSource object) {
  return [];
}

void _isarAudioSourceAttach(
    IsarCollection<dynamic> col, Id id, IsarAudioSource object) {
  object.id = id;
}

extension IsarAudioSourceQueryWhereSort
    on QueryBuilder<IsarAudioSource, IsarAudioSource, QWhere> {
  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhere> anyAudioMetaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'audioMetaId'),
      );
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhere>
      anyExpiresAtMillis() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'expiresAtMillis'),
      );
    });
  }
}

extension IsarAudioSourceQueryWhere
    on QueryBuilder<IsarAudioSource, IsarAudioSource, QWhereClause> {
  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhereClause>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhereClause> idBetween(
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhereClause>
      audioMetaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'audioMetaId',
        value: [null],
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhereClause>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhereClause>
      audioMetaIdEqualTo(int? audioMetaId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'audioMetaId',
        value: [audioMetaId],
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhereClause>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhereClause>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhereClause>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhereClause>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhereClause>
      expiresAtMillisIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'expiresAtMillis',
        value: [null],
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhereClause>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhereClause>
      expiresAtMillisEqualTo(int? expiresAtMillis) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'expiresAtMillis',
        value: [expiresAtMillis],
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhereClause>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhereClause>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhereClause>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterWhereClause>
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

extension IsarAudioSourceQueryFilter
    on QueryBuilder<IsarAudioSource, IsarAudioSource, QFilterCondition> {
  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      audioMetaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'audioMetaId',
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      audioMetaIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'audioMetaId',
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      audioMetaIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'audioMetaId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      expiresAtMillisIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expiresAtMillis',
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      expiresAtMillisIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expiresAtMillis',
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      expiresAtMillisEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiresAtMillis',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      sourceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'source',
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      sourceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'source',
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      sourceEqualTo(
    String? value, {
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      sourceGreaterThan(
    String? value, {
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      sourceLessThan(
    String? value, {
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      sourceBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      sourceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      sourceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'source',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      sourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      sourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      sourceTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sourceType',
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      sourceTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sourceType',
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      sourceTypeEqualTo(
    AudioSourceType? value, {
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      sourceTypeGreaterThan(
    AudioSourceType? value, {
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      sourceTypeLessThan(
    AudioSourceType? value, {
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      sourceTypeBetween(
    AudioSourceType? lower,
    AudioSourceType? upper, {
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
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

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      sourceTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      sourceTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      sourceTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceType',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterFilterCondition>
      sourceTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceType',
        value: '',
      ));
    });
  }
}

extension IsarAudioSourceQueryObject
    on QueryBuilder<IsarAudioSource, IsarAudioSource, QFilterCondition> {}

extension IsarAudioSourceQueryLinks
    on QueryBuilder<IsarAudioSource, IsarAudioSource, QFilterCondition> {}

extension IsarAudioSourceQuerySortBy
    on QueryBuilder<IsarAudioSource, IsarAudioSource, QSortBy> {
  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterSortBy>
      sortByAudioMetaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioMetaId', Sort.asc);
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterSortBy>
      sortByAudioMetaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioMetaId', Sort.desc);
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterSortBy>
      sortByExpiresAtMillis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAtMillis', Sort.asc);
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterSortBy>
      sortByExpiresAtMillisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAtMillis', Sort.desc);
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterSortBy> sortBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterSortBy>
      sortBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterSortBy>
      sortBySourceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceType', Sort.asc);
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterSortBy>
      sortBySourceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceType', Sort.desc);
    });
  }
}

extension IsarAudioSourceQuerySortThenBy
    on QueryBuilder<IsarAudioSource, IsarAudioSource, QSortThenBy> {
  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterSortBy>
      thenByAudioMetaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioMetaId', Sort.asc);
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterSortBy>
      thenByAudioMetaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioMetaId', Sort.desc);
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterSortBy>
      thenByExpiresAtMillis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAtMillis', Sort.asc);
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterSortBy>
      thenByExpiresAtMillisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAtMillis', Sort.desc);
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterSortBy> thenBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterSortBy>
      thenBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterSortBy>
      thenBySourceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceType', Sort.asc);
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QAfterSortBy>
      thenBySourceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceType', Sort.desc);
    });
  }
}

extension IsarAudioSourceQueryWhereDistinct
    on QueryBuilder<IsarAudioSource, IsarAudioSource, QDistinct> {
  QueryBuilder<IsarAudioSource, IsarAudioSource, QDistinct>
      distinctByAudioMetaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'audioMetaId');
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QDistinct>
      distinctByExpiresAtMillis() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiresAtMillis');
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QDistinct> distinctBySource(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'source', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarAudioSource, IsarAudioSource, QDistinct>
      distinctBySourceType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceType', caseSensitive: caseSensitive);
    });
  }
}

extension IsarAudioSourceQueryProperty
    on QueryBuilder<IsarAudioSource, IsarAudioSource, QQueryProperty> {
  QueryBuilder<IsarAudioSource, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarAudioSource, int?, QQueryOperations> audioMetaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'audioMetaId');
    });
  }

  QueryBuilder<IsarAudioSource, int?, QQueryOperations>
      expiresAtMillisProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiresAtMillis');
    });
  }

  QueryBuilder<IsarAudioSource, String?, QQueryOperations> sourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'source');
    });
  }

  QueryBuilder<IsarAudioSource, AudioSourceType?, QQueryOperations>
      sourceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceType');
    });
  }
}
