import 'package:dio/dio.dart';
import 'package:police_com/core/constants/api_constants.dart';
import 'package:police_com/core/mixins/logger_mixin.dart';

class DioClient with LoggerMixin {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  late final Dio dio;

  DioClient._internal() {
    final options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer ${ApiConstants.apiKey}',
      },
    );
    dio = Dio(options);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          logInfo('Request to ${options.uri}', tag: 'DioClient');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          logInfo(
            'Response from ${response.requestOptions.uri} -> Status: ${response.statusCode}',
            tag: 'DioClient',
          );
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          logError(
            'Error on ${e.requestOptions.uri}',
            error: e,
            stackTrace: e.stackTrace,
            tag: 'DioClient',
          );
          return handler.next(e);
        },
      ),
    );
  }

  Future<Response> getRequest(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      return response;
    } catch (error, stackTrace) {
      logError(
        'GET request failed for $path',
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<Response> postRequest(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (error, stackTrace) {
      logError(
        'POST request failed for $path',
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
