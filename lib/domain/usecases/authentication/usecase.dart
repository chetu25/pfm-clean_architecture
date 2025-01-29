import 'package:dartz/dartz.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';

///abstract class for all usecases.
///It takes in [Params] and returns [Either<AppError, T>]
abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
