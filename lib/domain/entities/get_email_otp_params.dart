// To parse this JSON data, do
//
//     final getEmailOtpparams = getEmailOtpparamsFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'get_email_otp_params.g.dart';

GetEmailOtpparams getEmailOtpparamsFromJson(String str) =>
    GetEmailOtpparams.fromJson(json.decode(str));

String getEmailOtpparamsToJson(GetEmailOtpparams data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GetEmailOtpparams {
  @JsonKey(name: "email")
  final String? email;

  GetEmailOtpparams({
    this.email,
  });

  GetEmailOtpparams copyWith({
    String? email,
  }) =>
      GetEmailOtpparams(
        email: email ?? this.email,
      );

  factory GetEmailOtpparams.fromJson(Map<String, dynamic> json) =>
      _$GetEmailOtpparamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetEmailOtpparamsToJson(this);
}
