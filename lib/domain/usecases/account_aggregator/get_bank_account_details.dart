import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/account_aggregator/bank_acc_model.dart';
import 'package:pfm_ekyc/domain/entities/no_params.dart';
import 'package:pfm_ekyc/domain/repositories/account_aggregator_repositories.dart';
import 'package:pfm_ekyc/domain/usecases/authentication/usecase.dart';

@injectable
class GetBankAccountDetails extends UseCase<BankAccModel, NoParams> {
  final AccountAggregatorRepositories repositories;

  GetBankAccountDetails(this.repositories);

  @override
  Future<Either<AppError, BankAccModel>> call(NoParams params) async =>
      await repositories.getBankData();
}
