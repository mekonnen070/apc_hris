import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                    accountName: Text(employee.firstName ?? 'N/A'),
                    accountEmail: Text(employee.email ?? 'N/A'),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,  
                      backgroundImage:
                          employee.photoUrl != null
                              ? NetworkImage(employee.photoUrl!)
                              : null,
                      child:
                          employee.photoUrl == null
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
                    backgroundColor: Colors.white,
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
                    child: Center(child: CircularProgressIndicator()),
                  ),
              // Show an error message inside the header on failure.
              error:
                  (error, stack) => SizedBox(
                    height: 180,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Error loading profile: ${error.toString()}',
                        ),
                      ),
                    ),
                  ),
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
            const LogoutButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
