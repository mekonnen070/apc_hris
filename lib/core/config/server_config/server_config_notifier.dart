import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/constants/app_constants.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'server_config.dart';

final serverConfigProvider = StateNotifierProvider<
  ServerConfigNotifier,
  AsyncValue<ServerConfig?>
>((ref) {
  // Note: This relies on sharedPreferencesProvider being overridden in main.dart
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
  /// Throws user-friendly localization keys on failure.
  Future<ServerConfig> _testAndSetConfig(ServerConfig config) async {
    final dio = Dio();
    // Using http for local IPs as per the original prompt.
    final url =
        'http://${config.ip}:${config.port}/health'; // Assuming a /health endpoint

    try {
      final response = await dio.get(url).timeout(const Duration(seconds: 3));
      if (response.statusCode == 200) {
        await _prefs.setString(AppConstants.kServerIpKey, config.ip);
        await _prefs.setInt(AppConstants.kServerPortKey, config.port);
        return config;
      } else {
        // The server is reachable but returned an error (e.g., 404, 500)
        throw 'errorUnexpectedResponse'; // ⭐️ Throw key
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw 'errorConnectionTimeout'; // ⭐️ Throw key
      }
      // For other Dio errors (e.g., connection refused), use a general message.
      throw 'errorServerUnreachable'; // ⭐️ Throw key
    } on SocketException {
      // This often happens if there's no route to the host (e.g., wrong IP, no network)
      throw 'errorServerUnreachable'; // ⭐️ Throw key
    } catch (e) {
      // Catch-all for any other unexpected errors.
      throw 'errorGeneric'; // ⭐️ Throw key
    }
  }

  Future<void> setConfig(ServerConfig config) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _testAndSetConfig(config));
  }

  Future<void> retestConnection() async {
    if (state.value != null) {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() => _testAndSetConfig(state.value!));
    }
  }

  Future<void> clearConfig() async {
    await _prefs.remove(AppConstants.kServerIpKey);
    await _prefs.remove(AppConstants.kServerPortKey);
    state = const AsyncValue.data(null);
  }
}
