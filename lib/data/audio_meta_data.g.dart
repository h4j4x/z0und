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
    r'code': PropertySchema(
      id: 1,
      name: r'code',
      type: IsarType.string,
    ),
    r'codeValue': PropertySchema(
      id: 2,
      name: r'codeValue',
      type: IsarType.string,
    ),
    r'durationInSeconds': PropertySchema(
      id: 3,
      name: r'durationInSeconds',
      type: IsarType.long,
    ),
    r'enabled': PropertySchema(
      id: 4,
      name: r'enabled',
      type: IsarType.bool,
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
    ),
    r'name': PropertySchema(
      id: 8,
      name: r'name',
      type: IsarType.string,
    ),
    r'nameValue': PropertySchema(
      id: 9,
      name: r'nameValue',
      type: IsarType.string,
    )
  },
  estimateSize: _audioMetaDataEstimateSize,
  serialize: _audioMetaDataSerialize,
  deserialize: _audioMetaDataDeserialize,
  deserializeProp: _audioMetaDataDeserializeProp,
  idName: r'id',
  indexes: {
    r'nameValue': IndexSchema(
      id: 371153387507224006,
      name: r'nameValue',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'nameValue',
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
  bytesCount += 3 + object.code.length * 3;
  {
    final value = object.codeValue;
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
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.nameValue;
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
  writer.writeString(offsets[1], object.code);
  writer.writeString(offsets[2], object.codeValue);
  writer.writeLong(offsets[3], object.durationInSeconds);
  writer.writeBool(offsets[4], object.enabled);
  writer.writeString(offsets[5], object.handlerId);
  writer.writeString(offsets[6], object.handlerIdValue);
  writer.writeBool(offsets[7], object.isEnabled);
  writer.writeString(offsets[8], object.name);
  writer.writeString(offsets[9], object.nameValue);
}

AudioMetaData _audioMetaDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AudioMetaData();
  object.audioName = reader.readStringOrNull(offsets[0]);
  object.codeValue = reader.readStringOrNull(offsets[2]);
  object.durationInSeconds = reader.readLongOrNull(offsets[3]);
  object.handlerIdValue = reader.readStringOrNull(offsets[6]);
  object.id = id;
  object.isEnabled = reader.readBoolOrNull(offsets[7]);
  object.nameValue = reader.readStringOrNull(offsets[9]);
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
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readBoolOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
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
      nameValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nameValue',
        value: [null],
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterWhereClause>
      nameValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nameValue',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterWhereClause>
      nameValueEqualTo(String? nameValue) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nameValue',
        value: [nameValue],
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterWhereClause>
      nameValueNotEqualTo(String? nameValue) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nameValue',
              lower: [],
              upper: [nameValue],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nameValue',
              lower: [nameValue],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nameValue',
              lower: [nameValue],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nameValue',
              lower: [],
              upper: [nameValue],
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

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition> codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition> codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition> codeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      codeValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'codeValue',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      codeValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'codeValue',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      codeValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codeValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      codeValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'codeValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      codeValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'codeValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      codeValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'codeValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      codeValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'codeValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      codeValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'codeValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      codeValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'codeValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      codeValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'codeValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      codeValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codeValue',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      codeValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'codeValue',
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

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      nameValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nameValue',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      nameValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nameValue',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      nameValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      nameValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      nameValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      nameValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      nameValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      nameValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      nameValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      nameValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      nameValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameValue',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterFilterCondition>
      nameValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameValue',
        value: '',
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

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> sortByCodeValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codeValue', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      sortByCodeValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codeValue', Sort.desc);
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

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> sortByNameValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameValue', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      sortByNameValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameValue', Sort.desc);
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

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> thenByCodeValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codeValue', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      thenByCodeValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codeValue', Sort.desc);
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

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy> thenByNameValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameValue', Sort.asc);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QAfterSortBy>
      thenByNameValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameValue', Sort.desc);
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

  QueryBuilder<AudioMetaData, AudioMetaData, QDistinct> distinctByCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QDistinct> distinctByCodeValue(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'codeValue', caseSensitive: caseSensitive);
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

  QueryBuilder<AudioMetaData, AudioMetaData, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AudioMetaData, AudioMetaData, QDistinct> distinctByNameValue(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameValue', caseSensitive: caseSensitive);
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

  QueryBuilder<AudioMetaData, String, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<AudioMetaData, String?, QQueryOperations> codeValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'codeValue');
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

  QueryBuilder<AudioMetaData, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<AudioMetaData, String?, QQueryOperations> nameValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameValue');
    });
  }
}
