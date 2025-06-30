// lib/core/network/redirect_interceptor.dart

import 'package:dio/dio.dart';

/// A custom exception to signal that the user's session has expired because
/// the server responded with a login page instead of JSON.
class SessionExpiredException extends DioException {
  SessionExpiredException({required super.requestOptions});

  @override
  String toString() {
    return 'SessionExpiredException: The API request was redirected to a login page.';
  }
}

/// An interceptor that checks for silent redirects to an HTML login page.
///
/// This is necessary when a server responds with a 200 OK and HTML content
/// for an API endpoint that should return JSON, which typically means the
/// user's session has expired.
class RedirectInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // We assume API requests should NOT return HTML.
    final isApiRequest = response.requestOptions.path.startsWith('/api/');
    final isHtmlResponse =
        response.headers
            .value(Headers.contentTypeHeader)
            ?.contains('text/html') ??
        false;

    if (isApiRequest && isHtmlResponse) {
      // This is an unexpected response. We reject the request with our
      // custom exception to signify that the session has expired.
      final error = SessionExpiredException(
        requestOptions: response.requestOptions,
      );
      return handler.reject(error);
    }

    // If it's a valid response, continue the chain.
    super.onResponse(response, handler);
  }
}
