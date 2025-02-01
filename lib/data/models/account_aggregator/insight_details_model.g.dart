// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insight_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsightDetailsModel _$InsightDetailsModelFromJson(Map<String, dynamic> json) =>
    InsightDetailsModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : InsightDetailsModelData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InsightDetailsModelToJson(
        InsightDetailsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

InsightDetailsModelData _$InsightDetailsModelDataFromJson(
        Map<String, dynamic> json) =>
    InsightDetailsModelData(
      spendingCategories: json['spending_categories'] == null
          ? null
          : SpendingCategories.fromJson(
              json['spending_categories'] as Map<String, dynamic>),
      incomesAndExpenses: (json['incomes_and_expenses'] as List<dynamic>?)
          ?.map((e) => IncomesAndExpense.fromJson(e as Map<String, dynamic>))
          .toList(),
      topTransactions: (json['top_transactions'] as List<dynamic>?)
          ?.map((e) => TopTransaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InsightDetailsModelDataToJson(
        InsightDetailsModelData instance) =>
    <String, dynamic>{
      'spending_categories': instance.spendingCategories,
      'incomes_and_expenses': instance.incomesAndExpenses,
      'top_transactions': instance.topTransactions,
    };

IncomesAndExpense _$IncomesAndExpenseFromJson(Map<String, dynamic> json) =>
    IncomesAndExpense(
      year: (json['year'] as num?)?.toInt(),
      month: (json['month'] as num?)?.toInt(),
      income: (json['income'] as num?)?.toDouble(),
      expense: (json['expense'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$IncomesAndExpenseToJson(IncomesAndExpense instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'income': instance.income,
      'expense': instance.expense,
    };

SpendingCategories _$SpendingCategoriesFromJson(Map<String, dynamic> json) =>
    SpendingCategories(
      data: json['data'] == null
          ? null
          : SpendingCategoriesData.fromJson(
              json['data'] as Map<String, dynamic>),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SpendingCategoriesToJson(SpendingCategories instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

SpendingCategoriesData _$SpendingCategoriesDataFromJson(
        Map<String, dynamic> json) =>
    SpendingCategoriesData(
      bankCharges: json['Bank Charges'] == null
          ? null
          : BankCharges.fromJson(json['Bank Charges'] as Map<String, dynamic>),
      cashWithdrawal: json['Cash Withdrawal'] == null
          ? null
          : CashWithdrawal.fromJson(
              json['Cash Withdrawal'] as Map<String, dynamic>),
      entertainment: json['Entertainment'] == null
          ? null
          : Entertainment.fromJson(
              json['Entertainment'] as Map<String, dynamic>),
      foodDrinks: json['Food & Drinks'] == null
          ? null
          : FoodDrinks.fromJson(json['Food & Drinks'] as Map<String, dynamic>),
      groceries: json['Groceries'] == null
          ? null
          : Groceries.fromJson(json['Groceries'] as Map<String, dynamic>),
      health: json['Health'] == null
          ? null
          : Health.fromJson(json['Health'] as Map<String, dynamic>),
      investments: json['Investments'] == null
          ? null
          : Investments.fromJson(json['Investments'] as Map<String, dynamic>),
      loan: json['Loan'] == null
          ? null
          : Loan.fromJson(json['Loan'] as Map<String, dynamic>),
      others: json['Others'] == null
          ? null
          : FoodDrinks.fromJson(json['Others'] as Map<String, dynamic>),
      professionalServices: json['Professional Services'] == null
          ? null
          : Groceries.fromJson(
              json['Professional Services'] as Map<String, dynamic>),
      shopping: json['Shopping'] == null
          ? null
          : Shopping.fromJson(json['Shopping'] as Map<String, dynamic>),
      transfer: json['Transfer'] == null
          ? null
          : FoodDrinks.fromJson(json['Transfer'] as Map<String, dynamic>),
      travelAndTransport: json['Travel and Transport'] == null
          ? null
          : BankCharges.fromJson(
              json['Travel and Transport'] as Map<String, dynamic>),
      utilityPayments: json['Utility Payments'] == null
          ? null
          : FoodDrinks.fromJson(
              json['Utility Payments'] as Map<String, dynamic>),
      vehicle: json['Vehicle'] == null
          ? null
          : Vehicle.fromJson(json['Vehicle'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpendingCategoriesDataToJson(
        SpendingCategoriesData instance) =>
    <String, dynamic>{
      'Bank Charges': instance.bankCharges,
      'Cash Withdrawal': instance.cashWithdrawal,
      'Entertainment': instance.entertainment,
      'Food & Drinks': instance.foodDrinks,
      'Groceries': instance.groceries,
      'Health': instance.health,
      'Investments': instance.investments,
      'Loan': instance.loan,
      'Others': instance.others,
      'Professional Services': instance.professionalServices,
      'Shopping': instance.shopping,
      'Transfer': instance.transfer,
      'Travel and Transport': instance.travelAndTransport,
      'Utility Payments': instance.utilityPayments,
      'Vehicle': instance.vehicle,
    };

BankCharges _$BankChargesFromJson(Map<String, dynamic> json) => BankCharges(
      data: json['data'] == null
          ? null
          : BankChargesData.fromJson(json['data'] as Map<String, dynamic>),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BankChargesToJson(BankCharges instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

BankChargesData _$BankChargesDataFromJson(Map<String, dynamic> json) =>
    BankChargesData(
      the2024: json['2024'] == null
          ? null
          : Purple2024.fromJson(json['2024'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BankChargesDataToJson(BankChargesData instance) =>
    <String, dynamic>{
      '2024': instance.the2024,
    };

Purple2024 _$Purple2024FromJson(Map<String, dynamic> json) => Purple2024(
      the5: (json['5'] as num?)?.toDouble(),
      the6: (json['6'] as num?)?.toDouble(),
      the7: (json['7'] as num?)?.toDouble(),
      the9: (json['9'] as num?)?.toDouble(),
      the10: (json['10'] as num?)?.toDouble(),
      the12: (json['12'] as num?)?.toDouble(),
      the8: (json['8'] as num?)?.toDouble(),
      the11: (json['11'] as num?)?.toInt(),
    );

Map<String, dynamic> _$Purple2024ToJson(Purple2024 instance) =>
    <String, dynamic>{
      '5': instance.the5,
      '6': instance.the6,
      '7': instance.the7,
      '9': instance.the9,
      '10': instance.the10,
      '12': instance.the12,
      '8': instance.the8,
      '11': instance.the11,
    };

CashWithdrawal _$CashWithdrawalFromJson(Map<String, dynamic> json) =>
    CashWithdrawal(
      data: json['data'] == null
          ? null
          : CashWithdrawalData.fromJson(json['data'] as Map<String, dynamic>),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CashWithdrawalToJson(CashWithdrawal instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

CashWithdrawalData _$CashWithdrawalDataFromJson(Map<String, dynamic> json) =>
    CashWithdrawalData(
      the2024: json['2024'] == null
          ? null
          : Fluffy2024.fromJson(json['2024'] as Map<String, dynamic>),
      the2025: json['2025'] == null
          ? null
          : The2025.fromJson(json['2025'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CashWithdrawalDataToJson(CashWithdrawalData instance) =>
    <String, dynamic>{
      '2024': instance.the2024,
      '2025': instance.the2025,
    };

Fluffy2024 _$Fluffy2024FromJson(Map<String, dynamic> json) => Fluffy2024(
      the5: (json['5'] as num?)?.toInt(),
      the8: (json['8'] as num?)?.toInt(),
    );

Map<String, dynamic> _$Fluffy2024ToJson(Fluffy2024 instance) =>
    <String, dynamic>{
      '5': instance.the5,
      '8': instance.the8,
    };

The2025 _$The2025FromJson(Map<String, dynamic> json) => The2025(
      the1: (json['1'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$The2025ToJson(The2025 instance) => <String, dynamic>{
      '1': instance.the1,
    };

Entertainment _$EntertainmentFromJson(Map<String, dynamic> json) =>
    Entertainment(
      data: json['data'] == null
          ? null
          : EntertainmentData.fromJson(json['data'] as Map<String, dynamic>),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EntertainmentToJson(Entertainment instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

EntertainmentData _$EntertainmentDataFromJson(Map<String, dynamic> json) =>
    EntertainmentData(
      the2024: json['2024'] == null
          ? null
          : Tentacled2024.fromJson(json['2024'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EntertainmentDataToJson(EntertainmentData instance) =>
    <String, dynamic>{
      '2024': instance.the2024,
    };

Tentacled2024 _$Tentacled2024FromJson(Map<String, dynamic> json) =>
    Tentacled2024(
      the7: (json['7'] as num?)?.toDouble(),
      the11: (json['11'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$Tentacled2024ToJson(Tentacled2024 instance) =>
    <String, dynamic>{
      '7': instance.the7,
      '11': instance.the11,
    };

FoodDrinks _$FoodDrinksFromJson(Map<String, dynamic> json) => FoodDrinks(
      data: json['data'] == null
          ? null
          : FoodDrinksData.fromJson(json['data'] as Map<String, dynamic>),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FoodDrinksToJson(FoodDrinks instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

FoodDrinksData _$FoodDrinksDataFromJson(Map<String, dynamic> json) =>
    FoodDrinksData(
      the2024: json['2024'] == null
          ? null
          : Purple2024.fromJson(json['2024'] as Map<String, dynamic>),
      the2025: json['2025'] == null
          ? null
          : The2025.fromJson(json['2025'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FoodDrinksDataToJson(FoodDrinksData instance) =>
    <String, dynamic>{
      '2024': instance.the2024,
      '2025': instance.the2025,
    };

Groceries _$GroceriesFromJson(Map<String, dynamic> json) => Groceries(
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GroceriesToJson(Groceries instance) => <String, dynamic>{
      'total': instance.total,
    };

Health _$HealthFromJson(Map<String, dynamic> json) => Health(
      data: json['data'] == null
          ? null
          : HealthData.fromJson(json['data'] as Map<String, dynamic>),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HealthToJson(Health instance) => <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

HealthData _$HealthDataFromJson(Map<String, dynamic> json) => HealthData(
      the2024: json['2024'] == null
          ? null
          : Sticky2024.fromJson(json['2024'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HealthDataToJson(HealthData instance) =>
    <String, dynamic>{
      '2024': instance.the2024,
    };

Sticky2024 _$Sticky2024FromJson(Map<String, dynamic> json) => Sticky2024(
      the5: (json['5'] as num?)?.toInt(),
      the9: (json['9'] as num?)?.toInt(),
    );

Map<String, dynamic> _$Sticky2024ToJson(Sticky2024 instance) =>
    <String, dynamic>{
      '5': instance.the5,
      '9': instance.the9,
    };

Investments _$InvestmentsFromJson(Map<String, dynamic> json) => Investments(
      data: json['data'] == null
          ? null
          : InvestmentsData.fromJson(json['data'] as Map<String, dynamic>),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$InvestmentsToJson(Investments instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

InvestmentsData _$InvestmentsDataFromJson(Map<String, dynamic> json) =>
    InvestmentsData(
      the2024: json['2024'] == null
          ? null
          : Indigo2024.fromJson(json['2024'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InvestmentsDataToJson(InvestmentsData instance) =>
    <String, dynamic>{
      '2024': instance.the2024,
    };

Indigo2024 _$Indigo2024FromJson(Map<String, dynamic> json) => Indigo2024(
      the6: (json['6'] as num?)?.toInt(),
      the9: (json['9'] as num?)?.toInt(),
    );

Map<String, dynamic> _$Indigo2024ToJson(Indigo2024 instance) =>
    <String, dynamic>{
      '6': instance.the6,
      '9': instance.the9,
    };

Loan _$LoanFromJson(Map<String, dynamic> json) => Loan(
      data: json['data'] == null
          ? null
          : LoanData.fromJson(json['data'] as Map<String, dynamic>),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LoanToJson(Loan instance) => <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

LoanData _$LoanDataFromJson(Map<String, dynamic> json) => LoanData(
      the2024: json['2024'] == null
          ? null
          : Indecent2024.fromJson(json['2024'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoanDataToJson(LoanData instance) => <String, dynamic>{
      '2024': instance.the2024,
    };

Indecent2024 _$Indecent2024FromJson(Map<String, dynamic> json) => Indecent2024(
      the7: (json['7'] as num?)?.toInt(),
    );

Map<String, dynamic> _$Indecent2024ToJson(Indecent2024 instance) =>
    <String, dynamic>{
      '7': instance.the7,
    };

Shopping _$ShoppingFromJson(Map<String, dynamic> json) => Shopping(
      data: json['data'] == null
          ? null
          : ShoppingData.fromJson(json['data'] as Map<String, dynamic>),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ShoppingToJson(Shopping instance) => <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

ShoppingData _$ShoppingDataFromJson(Map<String, dynamic> json) => ShoppingData(
      the2024: json['2024'] == null
          ? null
          : Hilarious2024.fromJson(json['2024'] as Map<String, dynamic>),
      the2025: json['2025'] == null
          ? null
          : The2025.fromJson(json['2025'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShoppingDataToJson(ShoppingData instance) =>
    <String, dynamic>{
      '2024': instance.the2024,
      '2025': instance.the2025,
    };

Hilarious2024 _$Hilarious2024FromJson(Map<String, dynamic> json) =>
    Hilarious2024(
      the5: (json['5'] as num?)?.toInt(),
      the7: (json['7'] as num?)?.toInt(),
      the8: (json['8'] as num?)?.toInt(),
      the9: (json['9'] as num?)?.toInt(),
      the10: (json['10'] as num?)?.toInt(),
    );

Map<String, dynamic> _$Hilarious2024ToJson(Hilarious2024 instance) =>
    <String, dynamic>{
      '5': instance.the5,
      '7': instance.the7,
      '8': instance.the8,
      '9': instance.the9,
      '10': instance.the10,
    };

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      data: json['data'] == null
          ? null
          : VehicleData.fromJson(json['data'] as Map<String, dynamic>),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

VehicleData _$VehicleDataFromJson(Map<String, dynamic> json) => VehicleData(
      the2024: json['2024'] == null
          ? null
          : Ambitious2024.fromJson(json['2024'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VehicleDataToJson(VehicleData instance) =>
    <String, dynamic>{
      '2024': instance.the2024,
    };

Ambitious2024 _$Ambitious2024FromJson(Map<String, dynamic> json) =>
    Ambitious2024(
      the7: (json['7'] as num?)?.toInt(),
      the8: (json['8'] as num?)?.toInt(),
      the9: (json['9'] as num?)?.toInt(),
      the11: (json['11'] as num?)?.toInt(),
      the12: (json['12'] as num?)?.toInt(),
    );

Map<String, dynamic> _$Ambitious2024ToJson(Ambitious2024 instance) =>
    <String, dynamic>{
      '7': instance.the7,
      '8': instance.the8,
      '9': instance.the9,
      '11': instance.the11,
      '12': instance.the12,
    };

TopTransaction _$TopTransactionFromJson(Map<String, dynamic> json) =>
    TopTransaction(
      type: json['type'] as String?,
      mode: json['mode'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      currentBalance: json['currentBalance'] as String?,
      transactionTimestamp: json['transactionTimestamp'] == null
          ? null
          : DateTime.parse(json['transactionTimestamp'] as String),
      valueDate: json['valueDate'] == null
          ? null
          : DateTime.parse(json['valueDate'] as String),
      txnId: json['txnId'] as String?,
      narration: json['narration'] as String?,
      reference: json['reference'] as String?,
      l1Category: json['l1Category'] as String?,
      l2Category: json['l2Category'] as String?,
      receiverSenderName: json['receiver_sender_name'] as String?,
      upiId: json['upi_id'] as String?,
    );

Map<String, dynamic> _$TopTransactionToJson(TopTransaction instance) =>
    <String, dynamic>{
      'type': instance.type,
      'mode': instance.mode,
      'amount': instance.amount,
      'currentBalance': instance.currentBalance,
      'transactionTimestamp': instance.transactionTimestamp?.toIso8601String(),
      'valueDate': instance.valueDate?.toIso8601String(),
      'txnId': instance.txnId,
      'narration': instance.narration,
      'reference': instance.reference,
      'l1Category': instance.l1Category,
      'l2Category': instance.l2Category,
      'receiver_sender_name': instance.receiverSenderName,
      'upi_id': instance.upiId,
    };
