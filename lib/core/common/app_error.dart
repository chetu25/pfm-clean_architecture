import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final AppErrorType errorType;
  final String? error;
  final int? statusCode;

  const AppError(this.errorType, {this.error, this.statusCode});

  @override
  List<Object> get props => [errorType];
}

enum AppErrorType {
  api,
  network,
  timeout,
  database,
}
