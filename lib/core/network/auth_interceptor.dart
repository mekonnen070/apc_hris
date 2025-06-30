// lib/core/network/auth_interceptor.dart

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/network/redirect_interceptor.dart'; // Import the custom exception
import 'package:police_com/features/auth/application/auth_notifier.dart';

class AuthInterceptor extends Interceptor {
  final Ref _ref;

  AuthInterceptor(this._ref);

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Check for both explicit 401 errors AND our custom session exception.
    if (err.response?.statusCode == 401 || err is SessionExpiredException) {
      // Use the ref to safely call the logout method.
      await _ref.read(authNotifierProvider.notifier).logout();
    }
    return handler.next(err);
  }
}