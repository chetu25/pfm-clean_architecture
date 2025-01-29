// To parse this JSON data, do
//
//     final phoneLoginParam = phoneLoginParamFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'phone_login_param.g.dart';

PhoneLoginParam phoneLoginParamFromJson(String str) =>
    PhoneLoginParam.fromJson(json.decode(str));

String phoneLoginParamToJson(PhoneLoginParam data) =>
    json.encode(data.toJson());

@JsonSerializable()
class PhoneLoginParam {
  @JsonKey(name: "mobile_number")
  final String mobileNumber;

  PhoneLoginParam({
    required this.mobileNumber,
  });

  PhoneLoginParam copyWith({
    String? mobileNumber,
  }) =>
      PhoneLoginParam(
        mobileNumber: mobileNumber ?? this.mobileNumber,
      );

  factory PhoneLoginParam.fromJson(Map<String, dynamic> json) =>
      _$PhoneLoginParamFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneLoginParamToJson(this);
}
