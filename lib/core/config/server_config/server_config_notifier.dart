import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/constants/app_constants.dart';
import 'package:police_com/core/network/dio_client.dart';
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

  Future<ServerConfig> _testAndSetConfig(ServerConfig config) async {
    final dio = Dio();
    final url = 'https://${config.ip}:${config.port}/api';

    try {
      final response = await dio.get(url).timeout(const Duration(seconds: 2));
      if (response.statusCode == 200) {
        await _prefs.setString(AppConstants.kServerIpKey, config.ip);
        await _prefs.setInt(AppConstants.kServerPortKey, config.port);
        return config;
      } else {
        throw 'Server returned an unexpected status code: ${response.statusCode}';
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw 'Connection timed out. Please check the server address and your network connection.';
      }
      throw 'Failed to connect to the server. Please check the IP address and port.';
    } on SocketException {
      throw 'Could not reach the server. Please check your network connection.';
    } catch (e) {
      throw 'An unexpected error occurred: $e';
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
