// To parse this JSON data, do
//
//     final phoneOtpModel = phoneOtpModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'phone_otp_model.g.dart';

PhoneOtpModel phoneOtpModelFromJson(String str) =>
    PhoneOtpModel.fromJson(json.decode(str));

String phoneOtpModelToJson(PhoneOtpModel data) => json.encode(data.toJson());

@JsonSerializable()
class PhoneOtpModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final Data? data;

  PhoneOtpModel({
    required this.success,
    required this.message,
    required this.data,
  });

  PhoneOtpModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      PhoneOtpModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory PhoneOtpModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneOtpModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneOtpModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "aliceblue_client")
  final String? aliceblueClient;
  @JsonKey(name: "get_client_details")
  final String? getClientDetails;

  Data({
    required this.token,
    required this.aliceblueClient,
    required this.getClientDetails,
  });

  Data copyWith({
    String? token,
    String? aliceblueClient,
    String? getClientDetails,
  }) =>
      Data(
        token: token ?? this.token,
        aliceblueClient: aliceblueClient ?? this.aliceblueClient,
        getClientDetails: getClientDetails ?? this.getClientDetails,
      );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
