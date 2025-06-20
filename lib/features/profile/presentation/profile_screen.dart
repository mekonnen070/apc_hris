// lib/features/profile/presentation/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/features/profile/application/profile_notifier.dart';
import 'package:police_com/features/profile/presentation/tabs/contacts_tab.dart';
import 'package:police_com/features/profile/presentation/tabs/dependants_tab.dart';
import 'package:police_com/features/profile/presentation/tabs/documents_tab.dart';
import 'package:police_com/features/profile/presentation/tabs/education_tab.dart';
import 'package:police_com/features/profile/presentation/tabs/experience_tab.dart';
import 'package:police_com/features/profile/presentation/tabs/performance_tab.dart';
import 'package:police_com/features/profile/presentation/tabs/personal_info_tab.dart';
import 'package:police_com/features/profile/presentation/tabs/spouse_tab.dart';
import 'package:police_com/features/widgets/something_went_wrong_widget.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // In a real app, this employeeId would come from an auth provider.
    final state = ref.watch(profileNotifierProvider('EMP-001'));
    final colorScheme = Theme.of(context).colorScheme;

    return state.when(
      loading:
          () => Scaffold(
            appBar: AppBar(title: const Text('My Profile')),
            body: const Center(child: CircularProgressIndicator()),
          ),
      error:
          (e, st) => Scaffold(
            appBar: AppBar(title: const Text('My Profile')),
            body: SomethingWentWrongWidget(
              onRetry: () => ref.invalidate(profileNotifierProvider('EMP-001')),
            ),
          ),
      data:
          (employee) => DefaultTabController(
            length: 8,
            child: Scaffold(
              body: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      expandedHeight: 280.0,
                      pinned: true,
                      stretch: true,
                      backgroundColor: colorScheme.surface,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          fit: StackFit.expand,
                          children: [
                            // Background Image with Parallax Effect
                            Image.network(
                              employee.photoUrl ??
                                  'https://images.unsplash.com/photo-1599819188825-658b54b2d355?q=80&w=2670&auto=format&fit=crop',
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) => Container(
                                    color: colorScheme.secondaryContainer,
                                  ),
                            ),
                            // Soft Scrim for text readability
                            DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    colorScheme.surface.withValues(alpha: 0.2),
                                    colorScheme.surface,
                                  ],
                                  stops: const [0.0, 0.7, 1.0],
                                ),
                              ),
                            ),
                            // Centered Content
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 50.0,
                                ), // Space for TabBar
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      radius: 52,
                                      backgroundColor: colorScheme.primary
                                          .withValues(alpha: 0.8),
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundImage:
                                            (employee.photoUrl != null)
                                                ? NetworkImage(
                                                  employee.photoUrl!,
                                                )
                                                : null,
                                        onBackgroundImageError: (e, s) {},
                                        backgroundColor:
                                            colorScheme.secondaryContainer,
                                        child:
                                            (employee.photoUrl == null)
                                                ? Icon(
                                                  Icons.person,
                                                  size: 60,
                                                  color:
                                                      colorScheme
                                                          .onSecondaryContainer,
                                                )
                                                : null,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      employee.computedFullName,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineSmall?.copyWith(
                                        color: colorScheme.onSurface,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      employee.positionId,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyLarge?.copyWith(
                                        color: colorScheme.onSurface.withValues(
                                          alpha: 0.8,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      bottom: TabBar(
                        isScrollable: true,
                        labelColor: colorScheme.primary,
                        unselectedLabelColor: colorScheme.onSurface.withValues(
                          alpha: 0.7,
                        ),
                        indicatorColor: colorScheme.primary,
                        indicatorWeight: 3,
                        tabs: const [
                          Tab(text: 'Personal'),
                          Tab(text: 'Dependants'),
                          Tab(text: 'Contacts'),
                          Tab(text: 'Spouse'),
                          Tab(text: 'Education'),
                          Tab(text: 'Experience'),
                          Tab(text: 'Performance'),
                          Tab(text: 'Documents'),
                        ],
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    PersonalInfoTab(employeeInfo: employee),
                    DependantsTab(employee: employee),
                    ContactsTab(employee: employee),
                    SpouseTab(employee: employee),
                    EducationTab(employee: employee),
                    ExperienceTab(employee: employee),
                    PerformanceTab(employee: employee),
                    DocumentsTab(employee: employee),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
