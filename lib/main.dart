import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:police_com/core/app_strings.dart';
import 'package:police_com/core/l10n/generated/app_localizations.dart';
import 'package:police_com/core/l10n/l10n.dart';
import 'package:police_com/core/l10n/language_controller.dart';
import 'package:police_com/core/network/dio_client.dart';
import 'package:police_com/core/theme/app_theme_controller.dart';
import 'package:police_com/features/auth/presentation/auth_wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  // 1. Ensure Flutter framework is initialized. This is mandatory.
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Asynchronously initialize all essential services *before* the app runs.
  final sharedPreferences = await SharedPreferences.getInstance();
  final appDocDir = await getApplicationDocumentsDirectory();

  // The Architect's Note:
  // This is the correct initialization based on the official documentation.
  final cookieJar = PersistCookieJar(
    storage: FileStorage('${appDocDir.path}/.cookies/'),
    ignoreExpires: true,
  );

  final themeData = await ThemeControllerProvider().initialize(
    sharedPreferences,
  );

  final container = ProviderContainer(
    overrides: [sharedPreferencesProvider.overrideWithValue(sharedPreferences)],
  );

  final dioClient = DioClient(cookieJar, container);

  runApp(
    ProviderScope(
      parent: container,
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        dioClientProvider.overrideWithValue(dioClient),
      ],
      child: MyApp(themeData: themeData),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key, required this.themeData});
  final ThemeData themeData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageControllerProvider);

    return ToastificationWrapper(
      config: const ToastificationConfig(alignment: Alignment.bottomCenter),
      child: ThemeProvider(
        initTheme: themeData,
        duration: const Duration(milliseconds: 500),
        builder: (_, theme) {
          return MaterialApp(
            theme: theme,
            home: const AuthWrapper(),
            navigatorKey: navigatorKey,
            title: AppStrings.appTitle,
            debugShowCheckedModeBanner: false,
            supportedLocales: L10n.all,
            locale: Locale(language.code),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
