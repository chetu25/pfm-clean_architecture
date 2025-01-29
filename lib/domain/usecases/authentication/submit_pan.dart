import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/authentication/update_pan_model.dart';
import 'package:pfm_ekyc/domain/entities/validate_pan_params.dart';
import 'package:pfm_ekyc/domain/repositories/account_repositories.dart';
import 'package:pfm_ekyc/domain/usecases/authentication/usecase.dart';

@injectable
class SubmitPan extends UseCase<UpdatePanModel, ValidatePanParams> {
  final AccountRepositories accountRepositories;
  SubmitPan(this.accountRepositories);
  @override
  Future<Either<AppError, UpdatePanModel>> call(
          ValidatePanParams params) async =>
      await accountRepositories.updatePanNumber(params.toJson());
}
