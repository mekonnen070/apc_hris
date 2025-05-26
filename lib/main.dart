import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/app_strings.dart';
import 'package:police_com/core/l10n/generated/app_localizations.dart';
import 'package:police_com/core/l10n/l10n.dart';
import 'package:police_com/core/l10n/language_controller.dart';
import 'package:police_com/core/theme/app_theme_controller.dart';
import 'package:police_com/features/widgets/splash_screen.dart';
import 'package:toastification/toastification.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeData = await ThemeControllerProvider().initialize();

  runApp(ProviderScope(child: MyApp(themeData: themeData)));
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
            home: const SplashScreen(),
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
