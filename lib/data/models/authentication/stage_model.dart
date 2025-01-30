// To parse this JSON data, do
//
//     final stageModel = stageModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'stage_model.g.dart';

StageModel stageModelFromJson(String str) =>
    StageModel.fromJson(json.decode(str));

String stageModelToJson(StageModel data) => json.encode(data.toJson());

@JsonSerializable()
class StageModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final Data? data;

  StageModel({
    this.success,
    this.message,
    this.data,
  });

  StageModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      StageModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory StageModel.fromJson(Map<String, dynamic> json) =>
      _$StageModelFromJson(json);

  Map<String, dynamic> toJson() => _$StageModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "email")
  final bool? email;
  @JsonKey(name: "pan_number")
  final bool? panNumber;
  @JsonKey(name: "dob")
  final bool? dob;
  @JsonKey(name: "aa_consent_status")
  final String? aaConsentStatus;
  @JsonKey(name: "aa_consent_datetime")
  final DateTime? aaConsentDatetime;
  @JsonKey(name: "aa_session_status")
  final String? aaSessionStatus;
  @JsonKey(name: "aa_session_datetime")
  final DateTime? aaSessionDatetime;
  @JsonKey(name: "aa_insights_status")
  final String? aaInsightsStatus;
  @JsonKey(name: "aa_insights_datetime")
  final DateTime? aaInsightsDatetime;

  Data({
    this.email,
    this.panNumber,
    this.dob,
    this.aaConsentStatus,
    this.aaConsentDatetime,
    this.aaSessionStatus,
    this.aaSessionDatetime,
    this.aaInsightsStatus,
    this.aaInsightsDatetime,
  });

  Data copyWith({
    bool? email,
    bool? panNumber,
    bool? dob,
    String? aaConsentStatus,
    DateTime? aaConsentDatetime,
    String? aaSessionStatus,
    DateTime? aaSessionDatetime,
    String? aaInsightsStatus,
    DateTime? aaInsightsDatetime,
  }) =>
      Data(
        email: email ?? this.email,
        panNumber: panNumber ?? this.panNumber,
        dob: dob ?? this.dob,
        aaConsentStatus: aaConsentStatus ?? this.aaConsentStatus,
        aaConsentDatetime: aaConsentDatetime ?? this.aaConsentDatetime,
        aaSessionStatus: aaSessionStatus ?? this.aaSessionStatus,
        aaSessionDatetime: aaSessionDatetime ?? this.aaSessionDatetime,
        aaInsightsStatus: aaInsightsStatus ?? this.aaInsightsStatus,
        aaInsightsDatetime: aaInsightsDatetime ?? this.aaInsightsDatetime,
      );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
