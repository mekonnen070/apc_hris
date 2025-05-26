import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/extensions/sub_module_extension.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:police_com/features/widgets/drawer/app_drawer.dart';
import 'package:police_com/features/widgets/theme_switcher_widget.dart';
import 'package:police_com/providers/drawer_selection_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSubModule = ref.watch(selectedSubModuleProvider);

    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBarWidget(
          title: selectedSubModule.title,
          actions: const [ThemeSwitcherWidget()],
        ),
        drawer: const AppDrawer(),
        body: selectedSubModule.body,
      ),
    );
  }
}
