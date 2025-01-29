import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/stage_model.dart';
import 'package:pfm_ekyc/domain/entities/no_params.dart';
import 'package:pfm_ekyc/domain/repositories/account_repositories.dart';
import 'package:pfm_ekyc/domain/usecases/authentication/usecase.dart';

@injectable
class CheckStages extends UseCase<StageModel, NoParams> {
  final AccountRepositories accountRepositories;
  CheckStages(this.accountRepositories);
  @override
  Future<Either<AppError, StageModel>> call(NoParams params) async =>
      await accountRepositories.getStages();
}
