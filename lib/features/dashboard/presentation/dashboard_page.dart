// lib/features/dashboard/presentation/dashboard_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:police_com/core/enums/sub_module_enum.dart';
import 'package:police_com/core/extensions/sub_module_extension.dart';
import 'package:police_com/providers/drawer_selection_provider.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildWelcomeHeader(textTheme, colorScheme),
          const SizedBox(height: 24),
          _buildQuickStats(context, colorScheme, textTheme),
          const SizedBox(height: 24),
          _buildSectionHeader(context, 'Quick Actions'),
          const SizedBox(height: 16),
          _buildActionGrid(context, ref),
          const SizedBox(height: 24),
          _buildSectionHeader(context, 'Recent Activity'),
          const SizedBox(height: 16),
          _buildRecentActivityList(context, colorScheme),
        ],
      ),
    );
  }

  Widget _buildWelcomeHeader(TextTheme textTheme, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat('EEEE, d MMMM yyyy').format(DateTime.now()),
          textAlign: TextAlign.left,
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Welcome back, Abe!',
          textAlign: TextAlign.left,
          style: textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickStats(
    BuildContext context,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            color: Colors.blue.shade50,
            icon: Icons.person_outline,
            iconColor: Colors.blue,
            label: 'Total Employees',
            value: '1,254',
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _StatCard(
            color: Colors.green.shade50,
            icon: Icons.pending_actions_outlined,
            iconColor: Colors.green,
            label: 'Pending Tasks',
            value: '8',
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
    );
  }

  Widget _buildActionGrid(BuildContext context, WidgetRef ref) {
    final quickActions =
        SubModule.values.where((s) => s != SubModule.dashboard).toList();

    return SizedBox(
      height: 95,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: quickActions.length,
        clipBehavior: Clip.none,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final module = quickActions[index];
          return SizedBox(
            width: 85,
            child: _ActionItem(
              icon: module.icon,
              label: module.title,
              onTap: () {
                ref.read(selectedSubModuleProvider.notifier).state = module;
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecentActivityList(
    BuildContext context,
    ColorScheme colorScheme,
  ) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: colorScheme.outline.withOpacity(0.2)),
      ),
      child: const Column(
        children: [
          _ActivityListItem(
            icon: Icons.file_download_done_outlined,
            iconColor: Colors.green,
            title: 'Leave Request Approved',
            subtitle: 'Annual leave for Abebe K. from Oct 2-5.',
            time: '2h ago',
          ),
          Divider(height: 1),
          _ActivityListItem(
            icon: Icons.new_releases_outlined,
            iconColor: Colors.orange,
            title: 'New Promotion Request',
            subtitle: 'From Sgt. Almaz T. for Lieutenant position.',
            time: '8h ago',
          ),
          Divider(height: 1),
          _ActivityListItem(
            icon: Icons.person_remove_outlined,
            iconColor: Colors.red,
            title: 'Resignation Submitted',
            subtitle: 'By Officer Kassahun M., effective Nov 1.',
            time: '1d ago',
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  const _StatCard({
    required this.color,
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 32),
          const SizedBox(height: 16),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: colorScheme.secondary)),
        ],
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityListItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String time;

  const _ActivityListItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: iconColor.withOpacity(0.1),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
      trailing: Text(time, style: Theme.of(context).textTheme.bodySmall),
      onTap: () {},
    );
  }
}
