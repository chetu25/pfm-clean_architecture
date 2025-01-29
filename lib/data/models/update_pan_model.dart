// To parse this JSON data, do
//
//     final updatePanModel = updatePanModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'update_pan_model.g.dart';

UpdatePanModel updatePanModelFromJson(String str) =>
    UpdatePanModel.fromJson(json.decode(str));

String updatePanModelToJson(UpdatePanModel data) => json.encode(data.toJson());

@JsonSerializable()
class UpdatePanModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<dynamic>? data;

  UpdatePanModel({
    this.success,
    this.message,
    this.data,
  });

  UpdatePanModel copyWith({
    bool? success,
    String? message,
    List<dynamic>? data,
  }) =>
      UpdatePanModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory UpdatePanModel.fromJson(Map<String, dynamic> json) =>
      _$UpdatePanModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePanModelToJson(this);
}
