import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/authentication/profile_model.dart';
import 'package:pfm_ekyc/domain/entities/no_params.dart';
import 'package:pfm_ekyc/domain/repositories/account_repositories.dart';
import 'package:pfm_ekyc/domain/usecases/authentication/usecase.dart';

@injectable
class GetProfileData extends UseCase<ProfileModel, NoParams> {
  final AccountRepositories accountRepositories;
  GetProfileData(this.accountRepositories);

  @override
  Future<Either<AppError, ProfileModel>> call(NoParams params) async =>
      await accountRepositories.fetchProfileData();
}
