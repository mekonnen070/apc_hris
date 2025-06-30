// lib/core/network/dio_client.dart

import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/config/app_config.dart';
import 'package:police_com/core/mixins/logger_mixin.dart';
import 'package:police_com/features/auth/application/auth_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

// The Architect's Note:
// Both of these providers now correctly throw errors if they are not overridden
// at the application root. This enforces the correct initialization pattern.
final dioClientProvider = Provider<DioClient>((ref) {
  throw UnimplementedError(
    'DioClient must be initialized and provided in main.dart',
  );
});

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError(
    'SharedPreferences must be initialized and provided in main.dart',
  );
});

class DioClient with LoggerMixin {
  final ProviderContainer _container;
  late final Dio dio;

  // The constructor is now simple and synchronous. It receives its fully-formed dependencies.
  DioClient(PersistCookieJar cookieJar, this._container) {
    final options = BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: const Duration(seconds: 20),
      validateStatus: (status) => status != null && status < 500,
    );

    dio = Dio(options);

    // Add the cookie manager interceptor for automatic session handling.
    dio.interceptors.add(CookieManager(cookieJar));

    // Add the interceptor for logging and global 401 Unauthorized error handling.
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          logInfo(
            'Request: ${options.method} ${options.uri}',
            tag: 'DioClient',
          );
          return handler.next(options);
        },
        onResponse: (response, handler) {
          logInfo(
            'Response: ${response.statusCode} ${response.requestOptions.uri}',
            tag: 'DioClient',
          );
          return handler.next(response);
        },
        onError: (e, handler) async {
          logError(
            'Error on ${e.requestOptions.path}: ${e.message}',
            error: e.error,
            tag: 'DioClient',
          );
          if (e.response?.statusCode == 401) {
            await _container.read(authNotifierProvider.notifier).logout();
          }
          return handler.next(e);
        },
      ),
    );

    // Handle self-signed certificates in debug mode.
    if (kDebugMode) {
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final client = HttpClient();
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      };
    }
  }

  // --- Public Methods ---
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) {
    return dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.post(path, data: data, queryParameters: queryParameters);
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.put(path, data: data, queryParameters: queryParameters);
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.delete(path, data: data, queryParameters: queryParameters);
  }
}
