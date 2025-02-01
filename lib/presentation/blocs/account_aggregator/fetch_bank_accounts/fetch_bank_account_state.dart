part of 'fetch_bank_account_bloc.dart';

abstract class FetchBankAccountState extends Equatable {
  const FetchBankAccountState();
}

class FetchBankAccountInitial extends FetchBankAccountState {
  @override
  List<Object> get props => [];
}

class FetchBankAccountLoading extends FetchBankAccountState {
  @override
  List<Object> get props => [];
}

class FetchBankAccountSuccess extends FetchBankAccountState {
  final BankAccModel bankAccModel;

  const FetchBankAccountSuccess({required this.bankAccModel});
  @override
  List<Object> get props => [bankAccModel];
}

class FetchBankAccountFailure extends FetchBankAccountState {
  final AppErrorType errorType;
  final String? errorMessage;

  const FetchBankAccountFailure({required this.errorType, this.errorMessage});

  @override
  List<Object?> get props => [errorType, errorMessage];
}
