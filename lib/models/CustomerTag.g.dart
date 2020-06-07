// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CustomerTag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerTag _$CustomerTagFromJson(Map<String, dynamic> json) {
  return CustomerTag()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..mark = json['mark'] as String
    ..count = json['count'] as int
    ..lastUpdateTime = json['lastUpdateTime'] as String
    ..isAuto = json['isAuto'] as bool
    ..updatePeriod = json['updatePeriod'] as int
    ..nextUpdateTime = json['nextUpdateTime'] as String;
}

Map<String, dynamic> _$CustomerTagToJson(CustomerTag instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mark': instance.mark,
      'count': instance.count,
      'lastUpdateTime': instance.lastUpdateTime,
      'isAuto': instance.isAuto,
      'updatePeriod': instance.updatePeriod,
      'nextUpdateTime': instance.nextUpdateTime,
    };
