import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/extensions/context_extension.dart';
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/auth/application/current_employee_provider.dart';
import 'package:police_com/features/employee_profile/domain/employee_info_model.dart';
import 'package:police_com/features/widgets/something_went_wrong_widget.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeState = ref.watch(currentEmployeeProvider);

    return Scaffold(
      body: SafeArea(
        child: employeeState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error:
              (e, st) => SomethingWentWrongWidget(
                onRetry: () => ref.invalidate(currentEmployeeProvider),
              ),
          data: (employee) {
            if (employee == null) {
              return Center(child: Text(context.lango.userNotFound));
            }
            return RefreshIndicator(
              onRefresh: () => ref.refresh(currentEmployeeProvider.future),
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _ProfileHeader(employee: employee),
                  const SizedBox(height: 24),
                  _InfoSection(
                    title: context.lango.contactInformation,
                    items: [
                      _InfoTile(
                        icon: Icons.email_outlined,
                        label: context.lango.email,
                        value: employee.email,
                      ),
                      _InfoTile(
                        icon: Icons.phone_outlined,
                        label: context.lango.phoneNumber,
                        value: employee.phone,
                      ),
                      _InfoTile(
                        icon: Icons.phone_android_outlined,
                        label: context.lango.mobileNumber,
                        value: employee.mobile,
                      ),
                      _InfoTile(
                        icon: Icons.location_on_outlined,
                        label: context.lango.address,
                        value: employee.address1,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _InfoSection(
                    title: context.lango.personalDetails,
                    items: [
                      _InfoTile(
                        icon: Icons.cake_outlined,
                        label: context.lango.birthDate,
                        value: DateFormat.yMMMd().format(employee.birthDate),
                      ),
                      _InfoTile(
                        icon: Icons.person_outline,
                        label: context.lango.gender,
                        value: employee.gender.name.toDisplayCase(),
                      ),
                      _InfoTile(
                        icon: Icons.favorite_border,
                        label: context.lango.maritalStatus,
                        value: employee.maritalStatus.name.toDisplayCase(),
                      ),
                      _InfoTile(
                        icon: Icons.bloodtype_outlined,
                        label: context.lango.bloodGroup,
                        value: employee.bloodGroup.name.toDisplayCase(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _InfoSection(
                    title: context.lango.employmentDetails,
                    items: [
                      _InfoTile(
                        icon: Icons.work_outline,
                        label: context.lango.position,
                        value: employee.positionId,
                      ),
                      _InfoTile(
                        icon: Icons.calendar_today_outlined,
                        label: context.lango.hiredDate,
                        value: DateFormat.yMMMd().format(employee.hiredDate),
                      ),
                      _InfoTile(
                        icon: Icons.badge_outlined,
                        label: context.lango.employmentStatus,
                        value: employee.employmentStatus.name.toDisplayCase(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  final EmployeeInfoModel employee;
  const _ProfileHeader({required this.employee});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final hasImage = employee.photoUrl != null && employee.photoUrl!.isNotEmpty;

    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 55,
            backgroundColor: colorScheme.primary.withOpacity(0.1),
            // --- THE FIX IS HERE ---
            // The inner CircleAvatar now uses CachedNetworkImageProvider
            child: CircleAvatar(
              radius: 50,
              backgroundColor: colorScheme.surfaceContainerHighest,
              // Use CachedNetworkImageProvider if a URL exists, otherwise null
              backgroundImage:
                  hasImage
                      ? CachedNetworkImageProvider(employee.photoUrl!)
                      : null,
              // The child is only shown if there is no image
              child:
                  !hasImage
                      ? Text(
                        employee.firstName.isNotEmpty
                            ? employee.firstName[0].toUpperCase()
                            : '?',
                        style: theme.textTheme.headlineLarge?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                      : null,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            employee.computedFullName,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            employee.positionId,
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  final String title;
  final List<_InfoTile> items;
  const _InfoSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
            ),
          ),
          child: Column(
            // --- THE FIX IS HERE ---
            // Replaced the incorrect ListView.separated with a simple for loop
            // that generates a List<Widget> directly, which is what Column expects.
            children: [
              for (int i = 0; i < items.length; i++) ...[
                ListTile(
                  leading: Icon(
                    items[i].icon,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: Text(items[i].label),
                  subtitle: Text(
                    items[i].value,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                if (i <
                    items.length - 1) // Add a divider for all but the last item
                  const Divider(height: 1, indent: 16, endIndent: 16),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoTile {
  final IconData icon;
  final String label;
  final String value;
  _InfoTile({required this.icon, required this.label, required this.value});
}
