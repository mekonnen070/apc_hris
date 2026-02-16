import 'dart:io';

/// Bypasses SSL certificate verification for servers with self-signed
/// certificates. This is a **temporary** measure to support both local
/// development and production servers that lack proper CA-signed certs.
///
// TODO: Remove once proper SSL certificates are deployed on all servers.
class UnsafeSslOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
