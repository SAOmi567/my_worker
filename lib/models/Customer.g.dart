// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer()
    ..id = json['id'] as int
    ..crmId = json['crmId'] as int
    ..name = json['name'] as String
    ..sex = json['sex'] as bool
    ..birthDate = json['birthDate'] as String
    ..cardNumber = json['cardNumber'] as String
    ..level = json['level'] as int
    ..balance = (json['balance'] as num)?.toDouble()
    ..totalConsumption = (json['totalConsumption'] as num)?.toDouble()
    ..memberPoint = json['memberPoint'] as int
    ..mobileNumber = json['mobileNumber'] as String
    ..createTime = json['createTime'] as String
    ..createStoreId = json['createStoreId'] as int
    ..creatorId = json['creatorId'] as int
    ..taobaoId = json['taobaoId'] as String;
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'crmId': instance.crmId,
      'name': instance.name,
      'sex': instance.sex,
      'birthDate': instance.birthDate,
      'cardNumber': instance.cardNumber,
      'level': instance.level,
      'balance': instance.balance,
      'totalConsumption': instance.totalConsumption,
      'memberPoint': instance.memberPoint,
      'mobileNumber': instance.mobileNumber,
      'createTime': instance.createTime,
      'createStoreId': instance.createStoreId,
      'creatorId': instance.creatorId,
      'taobaoId': instance.taobaoId,
    };
