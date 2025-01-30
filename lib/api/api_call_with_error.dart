import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/core/common/custom_exception.dart';

class ApiCallWithError {
  const ApiCallWithError._();

  static Future<Either<AppError, T>> call<T>(Future<T> Function() f) async {
    try {
      return Right(await f());
    } on SocketException {
      return const Left(
        AppError(AppErrorType.network),
      );
    } on TimeoutException {
      return const Left(
        AppError(AppErrorType.timeout),
      );
    } on CustomException catch (e) {
      return Left(
        AppError(AppErrorType.api,
            error: e.errorMessage, statusCode: e.errorCode),
      );
    } on Exception catch (e) {
      print('--------------------- ${e.toString()}');
      return const Left(
        AppError(AppErrorType.api),
      );
    }
  }
}
