// lib/core/network/dio_client.dart

import 'dart:developer' as developer;
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/config/app_config.dart';
import 'package:police_com/core/network/auth_interceptor.dart';
import 'package:police_com/core/network/redirect_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});
final cookieJarProvider = Provider<CookieJar>((ref) {
  throw UnimplementedError();
});
final dioClientProvider = Provider<DioClient>((ref) {
  final cj = ref.watch(cookieJarProvider);
  return DioClient(ref, cj);
});

class DioClient {
  final Dio dio;

  DioClient(Ref ref, CookieJar cookieJar)
    : dio = Dio(
        BaseOptions(
          baseUrl: AppConfig.baseUrl,
          connectTimeout: const Duration(seconds: 20),
          validateStatus: (s) => s != null && s < 500,
        ),
      ) {
    dio.interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => developer.log(obj.toString()),
      ),
      CookieManager(cookieJar),
      RedirectInterceptor(),
      AuthInterceptor(ref),
    ]);

    if (kDebugMode) {
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final client = HttpClient();
        client.badCertificateCallback = (_, __, ___) => true;
        return client;
      };
    }
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) =>
      dio.get(path, queryParameters: queryParameters);

  /// Default to JSON. Set [isMultipart] to true for FormData bodies.
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isMultipart = false,
  }) {
    return dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: isMultipart ? Options(contentType: 'multipart/form-data') : null,
    );
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isMultipart = false,
  }) {
    return dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: isMultipart ? Options(contentType: 'multipart/form-data') : null,
    );
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isMultipart = false,
  }) {
    return dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: isMultipart ? Options(contentType: 'multipart/form-data') : null,
    );
  }
}
