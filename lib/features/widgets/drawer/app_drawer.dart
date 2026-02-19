import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/config/server_config/server_config_notifier.dart';
import 'package:police_com/core/config/server_config/server_setup_screen.dart';
import 'package:police_com/core/constants/api_endpoints.dart';
import 'package:police_com/core/enums/sub_module_enum.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/core/extensions/sub_module_extension.dart';
import 'package:police_com/features/auth/application/current_employee_provider.dart';
import 'package:police_com/features/widgets/drawer/widgets/log_out_page.dart';
import 'package:police_com/features/widgets/language_switcher_widget.dart';
import 'package:police_com/providers/drawer_selection_provider.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the new global provider for the current employee's data.
    final employeeState = ref.watch(currentEmployeeProvider);
    final serverConfig = ref.watch(serverConfigProvider).valueOrNull;
    final baseUrl =
        serverConfig != null
            ? 'https://${serverConfig.ip}:${serverConfig.port}'
            : '';

    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            // The header now dynamically updates based on the employee state.
            employeeState.when(
              data: (employee) {
                // If data is available, display it.
                if (employee != null) {
                  return UserAccountsDrawerHeader(
                    accountName: Text(employee.firstName),
                    accountEmail: Text(employee.email),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage:
                          employee.photoUrl != null && baseUrl.isNotEmpty
                              ? NetworkImage(
                                '$baseUrl${ApiEndpoints.employeeImage}${employee.photoUrl!.split('\\').last}',
                              )
                              : null,
                      onBackgroundImageError: (_, __) {},
                      child:
                          employee.photoUrl == null || baseUrl.isEmpty
                              ? Text(
                                employee.firstName.isNotEmpty
                                    ? employee.firstName[0].toUpperCase()
                                    : '?',
                                style: const TextStyle(fontSize: 40.0),
                              )
                              : null,
                    ),
                    otherAccountsPictures: const [LanguageSwitcherWidget()],
                  );
                }
                // If data is null (logged out), show placeholders.
                return UserAccountsDrawerHeader(
                  accountName: Text(context.lango.userNamePlaceholder),
                  accountEmail: Text(context.lango.userEmailPlaceholder),
                  currentAccountPicture: CircleAvatar(
                    child: Text(
                      context.lango.userInitialsPlaceholder,
                      style: const TextStyle(fontSize: 40.0),
                    ),
                  ),
                  otherAccountsPictures: const [LanguageSwitcherWidget()],
                );
              },
              // Show a compact loader inside the header while fetching.
              loading:
                  () => const SizedBox(
                    height: 180,
                    child: Center(child: CircularProgressIndicator.adaptive()),
                  ),
              // Show an error message inside the header on failure.
              error: (error, stack) {
                // show a default placeholder
                return UserAccountsDrawerHeader(
                  accountName: Text(context.lango.userNamePlaceholder),
                  accountEmail: Text(context.lango.userEmailPlaceholder),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text(
                      context.lango.userInitialsPlaceholder,
                      style: const TextStyle(fontSize: 40.0),
                    ),
                  ),
                  otherAccountsPictures: const [LanguageSwitcherWidget()],
                );
              },
            ),

            // The rest of the drawer remains the same.
            for (final subModule in SubModule.values)
              ListTile(
                dense: true,
                leading: Icon(subModule.icon),
                title: Text(subModule.title(context)),
                onTap: () {
                  ref.read(selectedSubModuleProvider.notifier).state =
                      subModule;
                  Navigator.of(context).pop();
                },
              ),
            const Divider(),
            ListTile(
              dense: true,
              leading: const Icon(Icons.dns_outlined),
              title: Text(context.lango.changeServer),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (_) => const ServerSetupScreen(isFromSettings: true),
                  ),
                );
              },
            ),
            const Divider(),
            const LogoutButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
