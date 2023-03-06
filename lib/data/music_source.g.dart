// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_source.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetMusicSourceDataCollection on Isar {
  IsarCollection<MusicSourceData> get musics => this.collection();
}

const MusicSourceDataSchema = CollectionSchema(
  name: r'MusicSourceData',
  id: -915433430633565631,
  properties: {
    r'durationInSeconds': PropertySchema(
      id: 0,
      name: r'durationInSeconds',
      type: IsarType.long,
    ),
    r'enabled': PropertySchema(
      id: 1,
      name: r'enabled',
      type: IsarType.bool,
    ),
    r'handlerId': PropertySchema(
      id: 2,
      name: r'handlerId',
      type: IsarType.string,
    ),
    r'handlerIdValue': PropertySchema(
      id: 3,
      name: r'handlerIdValue',
      type: IsarType.string,
    ),
    r'isEnabled': PropertySchema(
      id: 4,
      name: r'isEnabled',
      type: IsarType.bool,
    ),
    r'songName': PropertySchema(
      id: 5,
      name: r'songName',
      type: IsarType.string,
    ),
    r'sourceName': PropertySchema(
      id: 6,
      name: r'sourceName',
      type: IsarType.string,
    ),
    r'sourceNameValue': PropertySchema(
      id: 7,
      name: r'sourceNameValue',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 8,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'updatedAtMillis': PropertySchema(
      id: 9,
      name: r'updatedAtMillis',
      type: IsarType.long,
    )
  },
  estimateSize: _musicSourceDataEstimateSize,
  serialize: _musicSourceDataSerialize,
  deserialize: _musicSourceDataDeserialize,
  deserializeProp: _musicSourceDataDeserializeProp,
  idName: r'id',
  indexes: {
    r'sourceNameValue': IndexSchema(
      id: 8940342964744239937,
      name: r'sourceNameValue',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'sourceNameValue',
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
  getId: _musicSourceDataGetId,
  getLinks: _musicSourceDataGetLinks,
  attach: _musicSourceDataAttach,
  version: '3.0.5',
);

int _musicSourceDataEstimateSize(
  MusicSourceData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.handlerId.length * 3;
  {
    final value = object.handlerIdValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.songName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.sourceName.length * 3;
  {
    final value = object.sourceNameValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _musicSourceDataSerialize(
  MusicSourceData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.durationInSeconds);
  writer.writeBool(offsets[1], object.enabled);
  writer.writeString(offsets[2], object.handlerId);
  writer.writeString(offsets[3], object.handlerIdValue);
  writer.writeBool(offsets[4], object.isEnabled);
  writer.writeString(offsets[5], object.songName);
  writer.writeString(offsets[6], object.sourceName);
  writer.writeString(offsets[7], object.sourceNameValue);
  writer.writeDateTime(offsets[8], object.updatedAt);
  writer.writeLong(offsets[9], object.updatedAtMillis);
}

MusicSourceData _musicSourceDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MusicSourceData();
  object.durationInSeconds = reader.readLongOrNull(offsets[0]);
  object.handlerIdValue = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.isEnabled = reader.readBoolOrNull(offsets[4]);
  object.songName = reader.readStringOrNull(offsets[5]);
  object.sourceNameValue = reader.readStringOrNull(offsets[7]);
  object.updatedAtMillis = reader.readLongOrNull(offsets[9]);
  return object;
}

P _musicSourceDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _musicSourceDataGetId(MusicSourceData object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _musicSourceDataGetLinks(MusicSourceData object) {
  return [];
}

void _musicSourceDataAttach(
    IsarCollection<dynamic> col, Id id, MusicSourceData object) {
  object.id = id;
}

extension MusicSourceDataQueryWhereSort
    on QueryBuilder<MusicSourceData, MusicSourceData, QWhere> {
  QueryBuilder<MusicSourceData, MusicSourceData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MusicSourceDataQueryWhere
    on QueryBuilder<MusicSourceData, MusicSourceData, QWhereClause> {
  QueryBuilder<MusicSourceData, MusicSourceData, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterWhereClause>
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

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterWhereClause> idBetween(
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

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterWhereClause>
      sourceNameValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sourceNameValue',
        value: [null],
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterWhereClause>
      sourceNameValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sourceNameValue',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterWhereClause>
      sourceNameValueEqualTo(String? sourceNameValue) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sourceNameValue',
        value: [sourceNameValue],
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterWhereClause>
      sourceNameValueNotEqualTo(String? sourceNameValue) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceNameValue',
              lower: [],
              upper: [sourceNameValue],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceNameValue',
              lower: [sourceNameValue],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceNameValue',
              lower: [sourceNameValue],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceNameValue',
              lower: [],
              upper: [sourceNameValue],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterWhereClause>
      handlerIdValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'handlerIdValue',
        value: [null],
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterWhereClause>
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

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterWhereClause>
      handlerIdValueEqualTo(String? handlerIdValue) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'handlerIdValue',
        value: [handlerIdValue],
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterWhereClause>
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

extension MusicSourceDataQueryFilter
    on QueryBuilder<MusicSourceData, MusicSourceData, QFilterCondition> {
  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      durationInSecondsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'durationInSeconds',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      durationInSecondsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'durationInSeconds',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      durationInSecondsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      enabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enabled',
        value: value,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      handlerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'handlerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      handlerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'handlerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      handlerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handlerId',
        value: '',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      handlerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'handlerId',
        value: '',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      handlerIdValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'handlerIdValue',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      handlerIdValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'handlerIdValue',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      handlerIdValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'handlerIdValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      handlerIdValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'handlerIdValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      handlerIdValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handlerIdValue',
        value: '',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      handlerIdValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'handlerIdValue',
        value: '',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      isEnabledIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isEnabled',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      isEnabledIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isEnabled',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      isEnabledEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      songNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'songName',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      songNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'songName',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      songNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'songName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      songNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'songName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      songNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'songName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      songNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'songName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      songNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'songName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      songNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'songName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      songNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'songName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      songNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'songName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      songNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'songName',
        value: '',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      songNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'songName',
        value: '',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceName',
        value: '',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceName',
        value: '',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sourceNameValue',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sourceNameValue',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceNameValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceNameValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceNameValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceNameValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceNameValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceNameValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceNameValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceNameValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceNameValue',
        value: '',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      sourceNameValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceNameValue',
        value: '',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      updatedAtMillisIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAtMillis',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      updatedAtMillisIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAtMillis',
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      updatedAtMillisEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAtMillis',
        value: value,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      updatedAtMillisGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAtMillis',
        value: value,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      updatedAtMillisLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAtMillis',
        value: value,
      ));
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterFilterCondition>
      updatedAtMillisBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAtMillis',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MusicSourceDataQueryObject
    on QueryBuilder<MusicSourceData, MusicSourceData, QFilterCondition> {}

extension MusicSourceDataQueryLinks
    on QueryBuilder<MusicSourceData, MusicSourceData, QFilterCondition> {}

extension MusicSourceDataQuerySortBy
    on QueryBuilder<MusicSourceData, MusicSourceData, QSortBy> {
  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      sortByDurationInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      sortByDurationInSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy> sortByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      sortByEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      sortByHandlerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerId', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      sortByHandlerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerId', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      sortByHandlerIdValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerIdValue', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      sortByHandlerIdValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerIdValue', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      sortByIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      sortByIsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      sortBySongName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      sortBySongNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      sortBySourceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceName', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      sortBySourceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceName', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      sortBySourceNameValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceNameValue', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      sortBySourceNameValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceNameValue', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      sortByUpdatedAtMillis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAtMillis', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      sortByUpdatedAtMillisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAtMillis', Sort.desc);
    });
  }
}

extension MusicSourceDataQuerySortThenBy
    on QueryBuilder<MusicSourceData, MusicSourceData, QSortThenBy> {
  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      thenByDurationInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      thenByDurationInSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy> thenByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      thenByEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      thenByHandlerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerId', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      thenByHandlerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerId', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      thenByHandlerIdValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerIdValue', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      thenByHandlerIdValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerIdValue', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      thenByIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      thenByIsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      thenBySongName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      thenBySongNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      thenBySourceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceName', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      thenBySourceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceName', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      thenBySourceNameValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceNameValue', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      thenBySourceNameValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceNameValue', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      thenByUpdatedAtMillis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAtMillis', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QAfterSortBy>
      thenByUpdatedAtMillisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAtMillis', Sort.desc);
    });
  }
}

extension MusicSourceDataQueryWhereDistinct
    on QueryBuilder<MusicSourceData, MusicSourceData, QDistinct> {
  QueryBuilder<MusicSourceData, MusicSourceData, QDistinct>
      distinctByDurationInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationInSeconds');
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QDistinct>
      distinctByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enabled');
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QDistinct> distinctByHandlerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'handlerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QDistinct>
      distinctByHandlerIdValue({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'handlerIdValue',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QDistinct>
      distinctByIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isEnabled');
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QDistinct> distinctBySongName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QDistinct>
      distinctBySourceName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QDistinct>
      distinctBySourceNameValue({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceNameValue',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<MusicSourceData, MusicSourceData, QDistinct>
      distinctByUpdatedAtMillis() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAtMillis');
    });
  }
}

extension MusicSourceDataQueryProperty
    on QueryBuilder<MusicSourceData, MusicSourceData, QQueryProperty> {
  QueryBuilder<MusicSourceData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MusicSourceData, int?, QQueryOperations>
      durationInSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationInSeconds');
    });
  }

  QueryBuilder<MusicSourceData, bool, QQueryOperations> enabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enabled');
    });
  }

  QueryBuilder<MusicSourceData, String, QQueryOperations> handlerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'handlerId');
    });
  }

  QueryBuilder<MusicSourceData, String?, QQueryOperations>
      handlerIdValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'handlerIdValue');
    });
  }

  QueryBuilder<MusicSourceData, bool?, QQueryOperations> isEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isEnabled');
    });
  }

  QueryBuilder<MusicSourceData, String?, QQueryOperations> songNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songName');
    });
  }

  QueryBuilder<MusicSourceData, String, QQueryOperations> sourceNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceName');
    });
  }

  QueryBuilder<MusicSourceData, String?, QQueryOperations>
      sourceNameValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceNameValue');
    });
  }

  QueryBuilder<MusicSourceData, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<MusicSourceData, int?, QQueryOperations>
      updatedAtMillisProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAtMillis');
    });
  }
}
