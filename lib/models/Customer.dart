import 'package:json_annotation/json_annotation.dart';


part 'Customer.g.dart';

@JsonSerializable()
class Customer {
      Customer();

  int id;
  int crmId;
  String name;
  bool sex;
  String birthDate;
  String cardNumber;
  int level;
  double balance;
  double totalConsumption;
  int memberPoint;
  String mobileNumber;
  String createTime;
  int createStoreId;
  int creatorId;
  String taobaoId;

  factory Customer.fromJson(Map<String,dynamic> json) => _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
