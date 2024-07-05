import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class DioHelper {
  static Dio? dio;

  static void initialDio(String baseUrl) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(milliseconds: 20000),
        receiveTimeout: const Duration(milliseconds: 40000),
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );
  }

  static void _logInfo(String message) {
    debugPrint('\x1B[34m$message\x1B[0m');
  }

  static void _logSuccess(String message) {
    debugPrint('\x1B[32m$message\x1B[0m');
  }

  static void _logError(String message) {
    debugPrint('\x1B[33m$message\x1B[0m');
  }

  static void setDioLogger(String baseUrl) {
    dio!.interceptors.addAll([
      InterceptorsWrapper(
        onResponse: (response, responseInterceptorHandler) {
          _logSuccess('${response.statusCode} - ${response.data.toString()}\n');
          return responseInterceptorHandler.next(response);
        },
        onRequest: (request, requestInterceptorHandler) {
          _logInfo(
            '${request.method} - ${request.path} - ${request.data} - ${request.queryParameters}',
          );
          return requestInterceptorHandler.next(request);
        },
        onError: (DioException error, errorInterceptor) async {
          _logError(error.message ?? 'Something went wrong');
          // int? responseCode = error.response?.statusCode;

          // todo : need to handle refresh token when the current token is expired
          // final refreshToken = getIt<SharedPreferences>().getString(
          //   PreferenceConstant.refreshToken,
          // );
          //
          // final accessTokenExpiredTime = getIt<SharedPreferences>().getInt(
          //   PreferenceConstant.tokenExpTime,
          // );
          //
          // final refreshTokenExpiredTime = getIt<SharedPreferences>().getInt(
          //   PreferenceConstant.refreshTokenExpTime,
          // );
          //
          // final currentTime = DateTime.now();
          //
          // final timeExpiredToken = DateTime.fromMillisecondsSinceEpoch(
          //   (accessTokenExpiredTime ?? 0) * 1000,
          // );
          //
          // final timeExpiredRefreshToken = DateTime.fromMillisecondsSinceEpoch(
          //   (refreshTokenExpiredTime ?? 0) * 1000,
          // );

          // if (responseCode == HttpStatus.unauthorized) {
          //   if (currentTime.compareTo(timeExpiredToken) > 0) {
          //     if (currentTime.compareTo(timeExpiredRefreshToken) < 0) {
          //       final response = await dio!.post(
          //         URLConstant.urlRefreshToken,
          //         options: Options(
          //           headers: {
          //             HttpHeaders.authorizationHeader: 'Bearer $refreshToken'
          //           },
          //         ),
          //       );
          //       if (response.isOk) {
          //         await getIt<SharedPreferences>().setString(
          //           PreferenceConstant.token,
          //           response.data['data']['access_token'],
          //         );
          //         await getIt<SharedPreferences>().setString(
          //           PreferenceConstant.refreshToken,
          //           response.data['data']['refresh_token'],
          //         );
          //
          //         await getIt<SharedPreferences>().setInt(
          //           PreferenceConstant.tokenExpTime,
          //           response.data['data']['at_expires'],
          //         );
          //         await getIt<SharedPreferences>().setInt(
          //           PreferenceConstant.refreshTokenExpTime,
          //           response.data['data']['rt_expires'],
          //         );
          //
          //         final newToken = getIt<SharedPreferences>().getString(
          //           PreferenceConstant.token,
          //         );
          //         DioHelper.setDioHeader(newToken);
          //         error.requestOptions.headers['Authorization'] =
          //         'Bearer $newToken';
          //
          //         return errorInterceptor.resolve(
          //           await DioHelper.dio!.fetch(error.requestOptions),
          //         );
          //       }
          //     } else {
          //       showToast(
          //         'Your session is expired, please re-login!',
          //         duration: const Duration(seconds: 3),
          //       );
          //       return errorInterceptor.next(error);
          //     }
          //   } else {
          //     return errorInterceptor.next(error);
          //   }
          // } else {
          //   return errorInterceptor.next(error);
          // }

          return errorInterceptor.next(error);
        },
      ),
    ]);
  }

  static void setDioTokenHeader(String? token) {
    dio!.options.headers = {HttpHeaders.authorizationHeader: 'Bearer $token'};
    debugPrint('Token User: $token');
  }

  static void clearDioTokenHeader() {
    dio!.options.headers.remove(HttpHeaders.authorizationHeader);
  }

  static String exception(DioException e) {
    String? message = 'Failed to process your request';

    // Handle DioError type-specific errors
    if (e.response != null) {
      _logError('DioError response status: ${e.response!.statusCode}');
      _logError('DioError response data: ${e.response!.data}');
      _logError('DioError response headers: ${e.response!.headers}');
      if (e.response?.data != null) {
        message =
            e.response?.data['message'].toString() ?? 'Something went wrong';
      }
    } else {
      _logError('DioError: ${e.message}');
      message = e.message ?? 'Something went wrong';
    }
    return message;
  }
}
