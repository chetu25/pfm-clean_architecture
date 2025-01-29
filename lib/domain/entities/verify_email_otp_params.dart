// To parse this JSON data, do
//
//     final verifyEmailOtpParams = verifyEmailOtpParamsFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'verify_email_otp_params.g.dart';

VerifyEmailOtpParams verifyEmailOtpParamsFromJson(String str) =>
    VerifyEmailOtpParams.fromJson(json.decode(str));

String verifyEmailOtpParamsToJson(VerifyEmailOtpParams data) =>
    json.encode(data.toJson());

@JsonSerializable()
class VerifyEmailOtpParams {
  @JsonKey(name: "email_otp")
  final String? emailOtp;

  VerifyEmailOtpParams({
    this.emailOtp,
  });

  VerifyEmailOtpParams copyWith({
    String? emailOtp,
  }) =>
      VerifyEmailOtpParams(
        emailOtp: emailOtp ?? this.emailOtp,
      );

  factory VerifyEmailOtpParams.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailOtpParamsFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyEmailOtpParamsToJson(this);
}
