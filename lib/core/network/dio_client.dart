import 'dart:developer' as developer;
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/config/server_config/server_config_notifier.dart'; // Make sure this path is correct
import 'package:police_com/core/network/auth_interceptor.dart';
import 'package:police_com/core/network/redirect_interceptor.dart'; // Make sure this path is correct
import 'package:shared_preferences/shared_preferences.dart';

// --- CORE PROVIDERS ---

/// Provides the SharedPreferences instance.
/// This should be overridden in main.dart during app initialization.
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  // This will be overridden in main.dart, but we provide a default
  // to prevent compilation errors.
  throw UnimplementedError('SharedPreferences provider was not overridden');
});

/// Provides the CookieJar instance for session management.
/// This should be overridden in main.dart during app initialization.
final cookieJarProvider = Provider<PersistCookieJar>((ref) {
  // This will be overridden in main.dart
  throw UnimplementedError('CookieJar provider was not overridden');
});

// --- DYNAMIC DIO PROVIDER ---

/// Creates a [Dio] instance that is dynamically configured based on the
/// current server settings. This is the heart of the reactive setup.
final dioProvider = Provider<Dio>((ref) {
  final serverConfigState = ref.watch(serverConfigProvider);
  final cookieJar = ref.watch(cookieJarProvider);

  // Safely get the server configuration.
  // The SplashScreen logic ensures this will not be null when an API call is made.
  final serverConfig = serverConfigState.valueOrNull;
  if (serverConfig == null) {
    // This state should not be reachable in the main app flow.
    // Throw an error to fail fast if it ever is.
    throw Exception(
      'Server configuration is not available. Cannot create Dio instance.',
    );
  }

  // Construct the base URL from the validated and saved server config.
  final baseUrl = 'http://${serverConfig.ip}:${serverConfig.port}/api';

  final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 20),
    validateStatus: (s) => s != null && s < 500,
  );

  final dio = Dio(options);

  // Add all necessary interceptors.
  dio.interceptors.addAll([
    // Log network requests and responses in debug mode.
    if (kDebugMode)
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => developer.log(obj.toString(), name: 'Dio'),
      ),
    // Manages cookies to maintain session.
    CookieManager(cookieJar),
    // Custom interceptors.
    RedirectInterceptor(),
    AuthInterceptor(ref),
  ]);

  // Allow self-signed certificates in debug mode for local development servers.
  if (kDebugMode) {
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };
  }

  return dio;
});

// --- SIMPLIFIED DIO CLIENT ---

/// Provides the final DioClient, which uses the dynamically configured Dio instance.
/// Repositories will watch this provider.
final dioClientProvider = Provider<DioClient>((ref) {
  final dio = ref.watch(dioProvider);
  return DioClient(dio);
});

/// A simple wrapper around the Dio instance to provide clean API methods.
/// This class no longer needs to know about Ref, CookieJar, or baseUrl.
class DioClient {
  final Dio _dio;
  DioClient(this._dio);

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) =>
      _dio.get(path, queryParameters: queryParameters);

  /// Default to JSON. Set [isMultipart] to true for FormData bodies.
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isMultipart = false,
  }) {
    return _dio.post(
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
    return _dio.put(
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
    return _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: isMultipart ? Options(contentType: 'multipart/form-data') : null,
    );
  }
}
