// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_source.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetMusicSourceDataCollection on Isar {
  IsarCollection<MusicSourceIsar> get musicSourceDatas => this.collection();
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
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _musicSourceDataGetId,
  getLinks: _musicSourceDataGetLinks,
  attach: _musicSourceDataAttach,
  version: '3.0.5',
);

int _musicSourceDataEstimateSize(
  MusicSourceIsar object,
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
  MusicSourceIsar object,
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

MusicSourceIsar _musicSourceDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MusicSourceIsar();
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

Id _musicSourceDataGetId(MusicSourceIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _musicSourceDataGetLinks(MusicSourceIsar object) {
  return [];
}

void _musicSourceDataAttach(
    IsarCollection<dynamic> col, Id id, MusicSourceIsar object) {
  object.id = id;
}

extension MusicSourceDataQueryWhereSort
    on QueryBuilder<MusicSourceIsar, MusicSourceIsar, QWhere> {
  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MusicSourceDataQueryWhere
    on QueryBuilder<MusicSourceIsar, MusicSourceIsar, QWhereClause> {
  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterWhereClause>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterWhereClause> idBetween(
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
}

extension MusicSourceDataQueryFilter
    on QueryBuilder<MusicSourceIsar, MusicSourceIsar, QFilterCondition> {
  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      durationInSecondsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'durationInSeconds',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      durationInSecondsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'durationInSeconds',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      durationInSecondsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      enabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enabled',
        value: value,
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      handlerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'handlerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      handlerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'handlerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      handlerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handlerId',
        value: '',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      handlerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'handlerId',
        value: '',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      handlerIdValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'handlerIdValue',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      handlerIdValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'handlerIdValue',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      handlerIdValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'handlerIdValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      handlerIdValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'handlerIdValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      handlerIdValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handlerIdValue',
        value: '',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      handlerIdValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'handlerIdValue',
        value: '',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      isEnabledIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isEnabled',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      isEnabledIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isEnabled',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      isEnabledEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      songNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'songName',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      songNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'songName',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      songNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'songName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      songNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'songName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      songNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'songName',
        value: '',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      songNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'songName',
        value: '',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      sourceNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      sourceNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      sourceNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceName',
        value: '',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      sourceNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceName',
        value: '',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      sourceNameValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sourceNameValue',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      sourceNameValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sourceNameValue',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      sourceNameValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceNameValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      sourceNameValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceNameValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      sourceNameValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceNameValue',
        value: '',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      sourceNameValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceNameValue',
        value: '',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      updatedAtMillisIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAtMillis',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      updatedAtMillisIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAtMillis',
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
      updatedAtMillisEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAtMillis',
        value: value,
      ));
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterFilterCondition>
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
    on QueryBuilder<MusicSourceIsar, MusicSourceIsar, QFilterCondition> {}

extension MusicSourceDataQueryLinks
    on QueryBuilder<MusicSourceIsar, MusicSourceIsar, QFilterCondition> {}

extension MusicSourceDataQuerySortBy
    on QueryBuilder<MusicSourceIsar, MusicSourceIsar, QSortBy> {
  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      sortByDurationInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      sortByDurationInSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy> sortByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      sortByEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      sortByHandlerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerId', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      sortByHandlerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerId', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      sortByHandlerIdValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerIdValue', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      sortByHandlerIdValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerIdValue', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      sortByIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      sortByIsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      sortBySongName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      sortBySongNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      sortBySourceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceName', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      sortBySourceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceName', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      sortBySourceNameValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceNameValue', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      sortBySourceNameValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceNameValue', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      sortByUpdatedAtMillis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAtMillis', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      sortByUpdatedAtMillisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAtMillis', Sort.desc);
    });
  }
}

extension MusicSourceDataQuerySortThenBy
    on QueryBuilder<MusicSourceIsar, MusicSourceIsar, QSortThenBy> {
  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      thenByDurationInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      thenByDurationInSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy> thenByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      thenByEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      thenByHandlerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerId', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      thenByHandlerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerId', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      thenByHandlerIdValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerIdValue', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      thenByHandlerIdValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handlerIdValue', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      thenByIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      thenByIsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      thenBySongName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      thenBySongNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      thenBySourceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceName', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      thenBySourceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceName', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      thenBySourceNameValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceNameValue', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      thenBySourceNameValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceNameValue', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      thenByUpdatedAtMillis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAtMillis', Sort.asc);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QAfterSortBy>
      thenByUpdatedAtMillisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAtMillis', Sort.desc);
    });
  }
}

extension MusicSourceDataQueryWhereDistinct
    on QueryBuilder<MusicSourceIsar, MusicSourceIsar, QDistinct> {
  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QDistinct>
      distinctByDurationInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationInSeconds');
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QDistinct>
      distinctByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enabled');
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QDistinct> distinctByHandlerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'handlerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QDistinct>
      distinctByHandlerIdValue({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'handlerIdValue',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QDistinct>
      distinctByIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isEnabled');
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QDistinct> distinctBySongName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QDistinct>
      distinctBySourceName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QDistinct>
      distinctBySourceNameValue({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceNameValue',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<MusicSourceIsar, MusicSourceIsar, QDistinct>
      distinctByUpdatedAtMillis() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAtMillis');
    });
  }
}

extension MusicSourceDataQueryProperty
    on QueryBuilder<MusicSourceIsar, MusicSourceIsar, QQueryProperty> {
  QueryBuilder<MusicSourceIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MusicSourceIsar, int?, QQueryOperations>
      durationInSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationInSeconds');
    });
  }

  QueryBuilder<MusicSourceIsar, bool, QQueryOperations> enabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enabled');
    });
  }

  QueryBuilder<MusicSourceIsar, String, QQueryOperations> handlerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'handlerId');
    });
  }

  QueryBuilder<MusicSourceIsar, String?, QQueryOperations>
      handlerIdValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'handlerIdValue');
    });
  }

  QueryBuilder<MusicSourceIsar, bool?, QQueryOperations> isEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isEnabled');
    });
  }

  QueryBuilder<MusicSourceIsar, String?, QQueryOperations> songNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songName');
    });
  }

  QueryBuilder<MusicSourceIsar, String, QQueryOperations> sourceNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceName');
    });
  }

  QueryBuilder<MusicSourceIsar, String?, QQueryOperations>
      sourceNameValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceNameValue');
    });
  }

  QueryBuilder<MusicSourceIsar, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<MusicSourceIsar, int?, QQueryOperations>
      updatedAtMillisProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAtMillis');
    });
  }
}
