import 'dart:developer' as developer;
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/config/server_config/server_config_notifier.dart'; // Import server config
import 'package:police_com/core/network/auth_interceptor.dart';
import 'package:police_com/core/network/redirect_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

// --- Providers ---

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences must be provided in main.dart');
});

final cookieJarProvider = Provider<CookieJar>((ref) {
  throw UnimplementedError('CookieJar must be provided in main.dart');
});

// --- THE FIX IS HERE ---
// The dioClientProvider now depends on the serverConfigProvider
final dioClientProvider = Provider<DioClient>((ref) {
  final cookieJar = ref.watch(cookieJarProvider);
  // Get the server configuration state
  final serverConfig = ref.watch(serverConfigProvider).valueOrNull;

  // If the config is missing, it's a critical error because the AppOrchestrator
  // should prevent this from ever happening in a real flow.
  if (serverConfig == null) {
    throw Exception(
      'DioClient cannot be created without a valid server configuration.',
    );
  }

  // Dynamically construct the baseUrl from the user's settings.
  final baseUrl = 'https://${serverConfig.ip}:${serverConfig.port}/api';

  return DioClient(ref, cookieJar, baseUrl);
});

// --- DioClient Implementation ---

class DioClient {
  final Dio dio;

  // The constructor now accepts the dynamic baseUrl
  DioClient(Ref ref, CookieJar cookieJar, String baseUrl)
    : dio = Dio(
        BaseOptions(
          baseUrl: baseUrl, // Use the passed-in baseUrl
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

    // if (kDebugMode) {
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };
    // }
  }

  // --- Public API Methods (Unchanged) ---
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

  Future<Response> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) => dio.patch(path, data: data, queryParameters: queryParameters);

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) => dio.delete(path, data: data, queryParameters: queryParameters);
}
