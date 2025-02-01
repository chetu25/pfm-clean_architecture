import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/account_aggregator/insight_details_model.dart';
import 'package:pfm_ekyc/domain/entities/no_params.dart';
import 'package:pfm_ekyc/domain/repositories/account_aggregator_repositories.dart';
import 'package:pfm_ekyc/domain/usecases/authentication/usecase.dart';

@injectable
class GetInsightDetails extends UseCase<InsightDetailsModel, NoParams> {
  final AccountAggregatorRepositories accountAggregatorRepository;

  GetInsightDetails(this.accountAggregatorRepository);

  @override
  Future<Either<AppError, InsightDetailsModel>> call(NoParams params) {
    return accountAggregatorRepository.getInsightInfo();
  }
}
