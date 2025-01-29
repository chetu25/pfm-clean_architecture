import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/api/token_services.dart';
import 'package:pfm_ekyc/core/common/app_keys.dart';
import 'package:pfm_ekyc/core/common/custom_exception.dart';
import 'package:pfm_ekyc/core/common/logger.dart';
import 'package:pfm_ekyc/routes/route.dart';

const String _h = 'api_client';

@lazySingleton
class ApiClient {
  final Dio _dio;
  final TokenService _tokenService;

  ApiClient(this._dio, this._tokenService);

  dynamic get(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool requiresToken = true,
  }) async {
    logInfo(_h, 'PATH:$path  QUERY PARAMS:$queryParameters');
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'Authorization':
                requiresToken ? 'Bearer ${await _tokenService.getToken()}' : '',
          },
        ),
      );
      logInfo(_h, 'Response ${response.data}');

      return response.data;
    } on DioException catch (e) {
      logError(_h, 'Dio Error: ${e.response?.data}');
      logErrorObject(_h, e, e.message ?? "");
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw TimeoutException(e.message);
      }
      if (e.type == DioExceptionType.unknown) {
        if (e.message!.contains('SocketException')) {
          throw SocketException(e.message ?? "");
        }
      }
      if (e.type == DioExceptionType.badResponse) {
        if (e.response?.statusCode == 102) {
          throw CustomException(errorCode: e.response?.statusCode);
        }
        if (e.response?.statusCode == 502) {
          throw CustomException(errorCode: e.response?.statusCode);
        }
        if (e.response?.statusCode == 401) {
          navigatorKey.currentState!.pushReplacementNamed(Routes.logout);
          throw CustomException(errorCode: e.response?.statusCode);
        }
        if (e.response?.statusCode == 400) {
          return e.response?.data;
        }
        if (e.response?.statusCode == 422) {
          return e.response?.data;
        }
      }
      if (e.response?.data is Map<String, dynamic>) {
        throw CustomException(
            errorCode: e.response?.statusCode,
            errorMessage:
                e.response?.data['message'] ?? e.response?.statusMessage);
      }
      throw CustomException(
        errorCode: e.response?.statusCode,
        errorMessage: e.response?.data['message'] ?? e.response?.statusMessage,
      );
    }
  }

  dynamic post(
    String path, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? queryParams,
    bool requiresToken = true,
    bool isFormData = false,
    FormData? formData,
  }) async {
    try {
      logInfo(_h,
          'PATH:$path  PARAMS:$params queryParams:$queryParams base_url:${_dio.options.baseUrl}');
      final headers = {
        'Authorization':
            requiresToken ? 'Bearer ${await _tokenService.getToken()}' : '',
      };

      final response = await _dio.post(
        path,
        data: isFormData ? formData! : params,
        queryParameters: queryParams,
        options: Options(
          contentType: isFormData ? Headers.formUrlEncodedContentType : null,
          headers: headers,
        ),
      );
      logSuccess(_h, 'Response: ${response.data}');

      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        logSuccess(_h, 'Response: ${e.response?.data}');
        return e.response?.data;
      }
      if (e.response?.statusCode == 422) {
        logSuccess(_h, 'Response: ${e.response?.data}');
        return e.response?.data;
      }
      logError(_h, 'Dio Error: ${e.response?.data}');
      logErrorObject(_h, e, e.message ?? "");

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw TimeoutException(e.message);
      }
      if (e.type == DioExceptionType.unknown) {
        if (e.message!.contains('SocketException')) {
          throw SocketException(e.message ?? "");
        }
        if (e.message!.contains('HandshakeException')) {
          throw HandshakeException(e.message ?? "");
        }
      }
      if (e.type == DioExceptionType.badResponse) {
        if (e.response?.statusCode == 401) {
          navigatorKey.currentState!.pushReplacementNamed(Routes.logout);
          throw CustomException(errorCode: e.response?.statusCode);
        }
        if (e.response?.statusCode == 102) {
          throw CustomException(errorCode: e.response?.statusCode);
        }
        if (e.response?.statusCode == 502) {
          throw CustomException(errorCode: e.response?.statusCode);
        }
      }
      if (e.response?.data is Map<String, dynamic>) {
        throw CustomException(
            errorCode: e.response?.statusCode,
            errorMessage:
                e.response?.data['message'] ?? e.response?.statusMessage);
      }
      throw CustomException(
          errorCode: e.response?.statusCode,
          errorMessage: e.response?.statusMessage);
    }
  }

  dynamic delete(
    String path, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? queryParams,
    bool requiresToken = true,
    bool isFormData = false,
    FormData? formData,
  }) async {
    try {
      logInfo(_h, 'PATH:$path  PARAMS:$params queryParams:$queryParams');
      final response = await _dio.delete(
        path,
        data: isFormData ? formData! : params,
        queryParameters: queryParams,
        options: Options(
          contentType: isFormData ? Headers.formUrlEncodedContentType : null,
          headers: {
            'Authorization':
                requiresToken ? 'Bearer ${await _tokenService.getToken()}' : '',
          },
        ),
      );
      logSuccess(_h, 'Response: ${response.data}');

      return response.data;
    } on DioException catch (e) {
      logError(_h, 'Dio Error: ${e.response?.data}');
      logErrorObject(_h, e, e.message ?? "");

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw TimeoutException(e.message);
      }
      if (e.type == DioExceptionType.unknown) {
        if (e.message!.contains('SocketException')) {
          throw SocketException(e.message ?? "");
        }
        if (e.message!.contains('HandshakeException')) {
          throw HandshakeException(e.message ?? "");
        }
      }
      if (e.type == DioExceptionType.badResponse) {
        if (e.response?.statusCode == 401) {
          navigatorKey.currentState!.pushReplacementNamed(Routes.logout);
          throw CustomException(errorCode: e.response?.statusCode);
        }
        if (e.response?.statusCode == 102) {
          throw CustomException(errorCode: e.response?.statusCode);
        }
        if (e.response?.statusCode == 502) {
          throw CustomException(errorCode: e.response?.statusCode);
        }
      }
      if (e.response?.data is Map<String, dynamic>) {
        throw CustomException(
            errorCode: e.response?.statusCode,
            errorMessage:
                e.response?.data['message'] ?? e.response?.statusMessage);
      }
      throw CustomException(
          errorCode: e.response?.statusCode,
          errorMessage: e.response?.statusMessage);
    }
  }
}
