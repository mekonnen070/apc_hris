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
import 'package:police_com/core/network/redirect_interceptor.dart'; // Import the new interceptor
import 'package:shared_preferences/shared_preferences.dart';

// --- Providers (No changes needed here) ---
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences must be provided in main.dart');
});

final cookieJarProvider = Provider<CookieJar>((ref) {
  throw UnimplementedError('CookieJar must be provided in main.dart');
});

final dioClientProvider = Provider<DioClient>((ref) {
  final cookieJar = ref.watch(cookieJarProvider);
  return DioClient(ref, cookieJar);
});

// --- DioClient Implementation ---
class DioClient {
  final Dio dio;

  DioClient(Ref ref, CookieJar cookieJar)
    : dio = Dio(
        BaseOptions(
          baseUrl: AppConfig.baseUrl,
          connectTimeout: const Duration(seconds: 20),
          validateStatus: (status) => status != null && status < 500,
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
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      };
    }
  }
  // --- Public API Methods (No changes needed) ---
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) =>
      dio.get(path, queryParameters: queryParameters);

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) => dio.post(path, data: data, queryParameters: queryParameters);

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) => dio.put(path, data: data, queryParameters: queryParameters);

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) => dio.delete(path, data: data, queryParameters: queryParameters);
}
