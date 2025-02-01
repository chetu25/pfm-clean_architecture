// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_acc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccModel _$BankAccModelFromJson(Map<String, dynamic> json) => BankAccModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BankAccModelToJson(BankAccModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      bankAccounts: (json['bank_accounts'] as List<dynamic>?)
          ?.map((e) => BankAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'bank_accounts': instance.bankAccounts,
    };

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) => BankAccount(
      bankName: json['bankName'] as String?,
      fIstatus: json['FIstatus'] as String?,
      balanceDateTime: json['balanceDateTime'] == null
          ? null
          : DateTime.parse(json['balanceDateTime'] as String),
      branch: json['branch'] as String?,
      currency: json['currency'] as String?,
      currentBalance: json['currentBalance'] as String?,
      currentOdLimit: json['currentODLimit'] as String?,
      drawingLimit: json['drawingLimit'] as String?,
      exchgeRate: json['exchgeRate'] as String?,
      ifscCode: json['ifscCode'] as String?,
      micrCode: json['micrCode'] as String?,
      openingDate: json['openingDate'] == null
          ? null
          : DateTime.parse(json['openingDate'] as String),
      pending: json['pending'] == null
          ? null
          : Pending.fromJson(json['pending'] as Map<String, dynamic>),
      status: json['status'] as String?,
      type: json['type'] as String?,
      maskedAccNumber: json['maskedAccNumber'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$BankAccountToJson(BankAccount instance) =>
    <String, dynamic>{
      'bankName': instance.bankName,
      'FIstatus': instance.fIstatus,
      'balanceDateTime': instance.balanceDateTime?.toIso8601String(),
      'branch': instance.branch,
      'currency': instance.currency,
      'currentBalance': instance.currentBalance,
      'currentODLimit': instance.currentOdLimit,
      'drawingLimit': instance.drawingLimit,
      'exchgeRate': instance.exchgeRate,
      'ifscCode': instance.ifscCode,
      'micrCode': instance.micrCode,
      'openingDate': instance.openingDate?.toIso8601String(),
      'pending': instance.pending,
      'status': instance.status,
      'type': instance.type,
      'maskedAccNumber': instance.maskedAccNumber,
      'error': instance.error,
    };

Pending _$PendingFromJson(Map<String, dynamic> json) => Pending(
      amount: json['amount'] as String?,
    );

Map<String, dynamic> _$PendingToJson(Pending instance) => <String, dynamic>{
      'amount': instance.amount,
    };
