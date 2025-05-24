import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/enums/main_module_enum.dart';
import 'package:police_com/core/extensions/main_module_extension.dart';
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
              accountName: Text('John Doe'),
              accountEmail: Text('John@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'JD',
                  style: TextStyle(fontSize: 40.0, color: Colors.blue),
                ),
              ),
              otherAccountsPictures: [LanguageSwitcherWidget()],
            ),

            for (final mainModule in MainModule.values)
              mainModule.subModules.length == 1
                  ? ListTile(
                    dense: true,
                    leading: Icon(mainModule.icon),
                    title: Text(mainModule.title),
                    onTap: () {
                      ref.read(selectedSubModuleProvider.notifier).state =
                          mainModule.subModules.first;
                      Navigator.of(context).pop();
                    },
                  )
                  : ExpansionTile(
                    dense: true,
                    key: PageStorageKey(mainModule.toString()),
                    leading: Icon(mainModule.icon),
                    title: Text(mainModule.title),
                    children:
                        mainModule.subModules.map((subModule) {
                          return ListTile(
                            title: Text(subModule.title),
                            onTap: () {
                              // Update the provider with the selected sub-module.
                              ref
                                  .read(selectedSubModuleProvider.notifier)
                                  .state = subModule;
                              Navigator.of(context).pop();
                            },
                          );
                        }).toList(),
                  ),
            const Divider(),
            LogOutPage(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
