import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pfm_ekyc/api/api_constants.dart';

@module
abstract class InjectionModule {
  @Named('baseUrl')
  // String get baseUrl => '${F.baseUrl}${ApiConstants.apiVersion}';
  String get baseUrl => ApiConstants.baseUrl;

  @lazySingleton
  Dio dio(@Named('baseUrl') String baseUrl) => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          contentType: Headers.jsonContentType,
          connectTimeout: const Duration(milliseconds: 60 * 1000),
          receiveTimeout: const Duration(milliseconds: 60 * 1000),
          sendTimeout: const Duration(milliseconds: 30 * 1000),
        ),
      );

  //any 3rd party package register inside getIT
  @lazySingleton
  Connectivity connectivity() => Connectivity();

  @lazySingleton
  LocalAuthentication get localAuth => LocalAuthentication();
}
