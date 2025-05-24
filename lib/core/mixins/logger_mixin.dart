import 'dart:developer' as developer;

mixin LoggerMixin {
  /// Logs informational messages.
  void logInfo(String message, {String? tag}) {
    developer.log('[INFO] $message', name: tag ?? runtimeType.toString());
  }

  /// Logs warning messages.
  void logWarning(String message, {String? tag}) {
    developer.log('[WARNING] $message', name: tag ?? runtimeType.toString());
  }

  /// Logs error messages.
  void logError(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    String? tag,
  }) {
    developer.log(
      '[ERROR] $message',
      name: tag ?? runtimeType.toString(),
      error: error,
      stackTrace: stackTrace,
    );
  }
}
