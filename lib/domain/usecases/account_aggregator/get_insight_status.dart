import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/account_aggregator/consent_status_model.dart';
import 'package:pfm_ekyc/domain/entities/no_params.dart';
import 'package:pfm_ekyc/domain/repositories/account_aggregator_repositories.dart';
import 'package:pfm_ekyc/domain/usecases/authentication/usecase.dart';

@injectable
class GetInsightStatus extends UseCase<ConsentStatusModel, NoParams> {
  final AccountAggregatorRepositories accountAggregatorRepositories;

  GetInsightStatus(this.accountAggregatorRepositories);

  @override
  Future<Either<AppError, ConsentStatusModel>> call(NoParams params) async =>
      await accountAggregatorRepositories.getInsightStatus();
}
