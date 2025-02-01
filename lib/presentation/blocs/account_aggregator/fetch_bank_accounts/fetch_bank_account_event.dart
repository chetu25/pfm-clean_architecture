part of 'fetch_bank_account_bloc.dart';

abstract class FetchBankAccountEvent extends Equatable {
  const FetchBankAccountEvent();

  @override
  List<Object> get props => [];
}

class FetchBankEvent extends FetchBankAccountEvent {
  @override
  List<Object> get props => [];
}
