import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart'; // Import for kDebugMode
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/constants/app_constants.dart';
import 'package:police_com/core/network/dio_client.dart'; // Keep for sharedPreferencesProvider
import 'package:shared_preferences/shared_preferences.dart';

import 'server_config.dart';

final serverConfigProvider =
    StateNotifierProvider<ServerConfigNotifier, AsyncValue<ServerConfig?>>((
      ref,
    ) {
      return ServerConfigNotifier(ref.watch(sharedPreferencesProvider));
    });

class ServerConfigNotifier extends StateNotifier<AsyncValue<ServerConfig?>> {
  final SharedPreferences _prefs;

  ServerConfigNotifier(this._prefs) : super(const AsyncValue.loading()) {
    _loadConfig();
  }

  Future<void> _loadConfig() async {
    final ip = _prefs.getString(AppConstants.kServerIpKey);
    final port = _prefs.getInt(AppConstants.kServerPortKey);

    if (ip != null && port != null) {
      final config = ServerConfig(ip: ip, port: port);
      state = await AsyncValue.guard(() => _testAndSetConfig(config));
    } else {
      state = const AsyncValue.data(null);
    }
  }

  /// Tests the connection and saves the config if successful.
  Future<ServerConfig> _testAndSetConfig(ServerConfig config) async {
    final dio = Dio();

    // --- THE FIX: PART 1 ---
    // Use the correct `https` protocol to match the working configuration.
    final url = 'https://${config.ip}:${config.port}';

    // --- THE FIX: PART 2 ---
    // In debug mode, we must configure this temporary Dio instance to trust
    // the self-signed certificate, just like the main DioClient does.
    if (kDebugMode) {
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final client = HttpClient();
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      };
    }

    try {
      // We don't need to check the status code; a successful response is enough.
      // A simple ping to the base URL is sufficient.
      await dio.get(url).timeout(const Duration(seconds: 5));

      // If the request succeeds, save the config.
      await _prefs.setString(AppConstants.kServerIpKey, config.ip);
      await _prefs.setInt(AppConstants.kServerPortKey, config.port);
      return config;
    } on DioException catch (e, st) {
      log(
        'DioException during server test: ${e.type}',
        error: e,
        stackTrace: st,
      );
      if (e.type == DioExceptionType.connectionTimeout) {
        throw 'errorConnectionTimeout'; // Connection timed out
      }
      // For other Dio errors (connection refused, certificate issues if not handled), use a general message.
      throw 'errorServerUnreachable';
    } on SocketException catch (e, st) {
      log('SocketException during server test', error: e, stackTrace: st);
      throw 'errorServerUnreachable';
    } catch (e, st) {
      log('Generic exception during server test', error: e, stackTrace: st);
      throw 'errorGeneric';
    }
  }

  Future<void> setConfig(ServerConfig config) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _testAndSetConfig(config));
  }

  Future<void> retestConnection() async {
    final currentConfig = state.valueOrNull;
    if (currentConfig != null) {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() => _testAndSetConfig(currentConfig));
    }
  }

  Future<void> clearConfig() async {
    await _prefs.remove(AppConstants.kServerIpKey);
    await _prefs.remove(AppConstants.kServerPortKey);
    state = const AsyncValue.data(null);
  }
}
