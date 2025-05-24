import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/theme/app_theme_controller.dart';

class ThemeSwitcherWidget extends ConsumerWidget {
  const ThemeSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ThemeSwitcher.withTheme(
      builder: (_, switcher, theme) {
        return IconButton(
          onPressed: () async {
            final brightness = theme.brightness;

            switcher.changeTheme(
              theme:
                  brightness == Brightness.dark
                      ? ref.read(themeControllerProvider).lightThemeData
                      : ref.read(themeControllerProvider).darkThemeData,
            );

            await ref
                .read(themeControllerProvider.notifier)
                .setThemeMode(
                  brightness == Brightness.dark
                      ? ThemeMode.light
                      : ThemeMode.dark,
                );
          },
          icon: Icon(
            ref.watch(themeControllerProvider).themeMode == ThemeMode.dark
                ? Icons.dark_mode
                : Icons.light_mode,
            color: Theme.of(context).buttonTheme.colorScheme?.primary,
          ),
        );
      },
    );
  }
}
