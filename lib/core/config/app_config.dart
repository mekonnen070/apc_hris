// lib/core/config/app_config.dart

class AppConfig {
  const AppConfig._();

  // This flag controls the data source for the entire application.
  static const bool useMockData = false;

  // The Architect's Note:
  // THE PROTOCOL MUST BE 'https'. THIS IS NON-NEGOTIABLE.
  static const String baseUrl = 'https://192.168.8.172:7153/api';
}
