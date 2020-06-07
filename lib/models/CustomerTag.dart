import 'package:json_annotation/json_annotation.dart';


part 'CustomerTag.g.dart';

@JsonSerializable()
class CustomerTag {
      CustomerTag();

  int id;
  String name;
  String mark;
  int count;
  String lastUpdateTime;
  bool isAuto;
  int updatePeriod;
  String nextUpdateTime;

  factory CustomerTag.fromJson(Map<String,dynamic> json) => _$CustomerTagFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerTagToJson(this);
}
