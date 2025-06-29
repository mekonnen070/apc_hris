import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/enums/sub_module_enum.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/core/extensions/sub_module_extension.dart';
import 'package:police_com/features/widgets/drawer/widgets/log_out_page.dart';
import 'package:police_com/features/widgets/language_switcher_widget.dart';
import 'package:police_com/providers/drawer_selection_provider.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(context.lango.userNamePlaceholder), // <-- REPLACED
              accountEmail: Text(context.lango.userEmailPlaceholder), // <-- REPLACED
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  context.lango.userInitialsPlaceholder, // <-- REPLACED
                  style: const TextStyle(fontSize: 40.0, color: Colors.blue),
                ),
              ),
              otherAccountsPictures: const [LanguageSwitcherWidget()],
            ),

            // Create a single, flat list of all sub-modules.
            for (final subModule in SubModule.values)
              ListTile(
                dense: true,
                leading: Icon(subModule.icon),
                title: Text(subModule.title(context)),
                onTap: () {
                  ref.read(selectedSubModuleProvider.notifier).state = subModule;
                  Navigator.of(context).pop();
                },
              ),
            const Divider(),
            const LogOutPage(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}