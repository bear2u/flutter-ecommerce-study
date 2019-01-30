// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Test _$TestFromJson(Map<String, dynamic> json) {
  return Test(
      name: json['name'] as String,
      birth: json['birth'] as String,
      age: json['age'] as int,
      male: _$enumDecodeNullable(_$SexEnumMap, json['male']));
}

Map<String, dynamic> _$TestToJson(Test instance) => <String, dynamic>{
      'name': instance.name,
      'birth': instance.birth,
      'age': instance.age,
      'male': _$SexEnumMap[instance.male]
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

T _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}

const _$SexEnumMap = <Sex, dynamic>{Sex.MALE: 'MALE', Sex.FEMALE: 'FEMALE'};
