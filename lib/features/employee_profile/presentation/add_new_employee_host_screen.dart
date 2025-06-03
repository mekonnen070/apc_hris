import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/features/employee_profile/application/providers/add_new_employee_step_provider.dart';
import 'package:police_com/features/employee_profile/application/providers/employee_creation_provider.dart';

import 'contacts/employee_contacts_screen.dart';
import 'dependants/employee_dependants_screen.dart';
import 'documents/employee_general_documents_screen.dart';
import 'education/employee_education_screen.dart';
// Import all the step screens
import 'employee_core_info_screen.dart';
import 'experience/employee_experience_screen.dart';
import 'performance/employee_performance_list_screen.dart';
import 'review_registration/review_and_submit_screen.dart';
import 'spouse/employee_spouse_info_screen.dart';

class AddNewEmployeeHostScreen extends HookConsumerWidget {
  const AddNewEmployeeHostScreen({super.key, this.employeeIdToEdit});

  final String?
  employeeIdToEdit; // Optional: If used for editing an existing employee

  // Define the sequence of screens for the PageView
  // This order determines the flow.
  // This list being static means the widgets themselves are created once.
  // If data needs to be reloaded into them when employeeIdToEdit changes,
  // those child widgets need to handle that (e.g. via useEffect watching a provider).
  // The keying strategy discussed previously addresses this by recreating child widgets.
  // For now, addressing the navigation issue based on current structure.
  static final List<Widget> _employeeCreationSteps = [
    const EmployeeCoreInfoScreen(),
    const EmployeeContactsScreen(),
    const EmployeeDependantsScreen(),
    const EmployeeEducationScreen(),
    const EmployeeExperienceScreen(),
    const EmployeeSpouseInfoScreen(),
    const EmployeeGeneralDocumentsScreen(),
    const EmployeePerformanceListScreen(),
    const ReviewAndSubmitScreen(),
  ];

  static int get totalSteps => _employeeCreationSteps.length;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController(
      initialPage: ref.read(currentEmployeeCreationStepProvider),
    );
    final currentStep = ref.watch(currentEmployeeCreationStepProvider);

    // Effect to prepare a new employee form or load an existing one.
    // Runs when employeeIdToEdit changes or on initial mount.
    useEffect(() {
      if (employeeIdToEdit != null) {
        print(
          'Host Screen: Editing mode for employee ID $employeeIdToEdit. Loading data...',
        );
        // loadEmployeeForEditing is async. The UI of child screens should handle
        // showing loading states or reacting to data becoming available from EmployeeCreationNotifier.
        ref
            .read(employeeCreationNotifierProvider.notifier)
            .loadEmployeeForEditing(employeeIdToEdit!);
      } else {
        print('Host Screen: New employee mode. Preparing new form.');
        // Ensure this runs after the first frame to avoid issues during build.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            // Check if widget is still in the tree
            ref
                .read(employeeCreationNotifierProvider.notifier)
                .prepareNewEmployee();
            // Reset to the first step if not already there for a new employee.
            if (ref.read(currentEmployeeCreationStepProvider) != 0) {
              ref.read(currentEmployeeCreationStepProvider.notifier).state = 0;
            }
            // Ensure PageController is also at the first page.
            if (pageController.hasClients && pageController.page != 0) {
              pageController.jumpToPage(0);
            }
          }
        });
      }
      return null;
    }, [employeeIdToEdit]); // Depend on employeeIdToEdit

    // Effect to animate PageView when currentEmployeeCreationStepProvider changes.
    // This is the primary way the PageView should be controlled.
    useEffect(
      () {
        if (pageController.hasClients) {
          final currentPageControllerPage = pageController.page?.round();
          if (currentPageControllerPage != currentStep) {
            // Use addPostFrameCallback to ensure animation happens after build.
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (pageController.hasClients) {
                // Re-check as it's in a callback
                pageController.animateToPage(
                  currentStep,
                  duration: const Duration(
                    milliseconds: 350,
                  ), // Slightly adjusted duration
                  curve: Curves.easeInOutCubic, // Smoother curve
                );
              }
            });
          }
        }
        return null;
      },
      [currentStep, pageController],
    ); // Depend on currentStep and pageController itself

    Future<bool> handleSystemBackPress() async {
      final currentStepVal = ref.read(currentEmployeeCreationStepProvider);
      if (currentStepVal > 0) {
        // Before navigating back, ensure current step's data is saved if necessary.
        // This logic should ideally be in the child screen's onPrevious handler.
        // For now, just changing the step.
        ref.read(currentEmployeeCreationStepProvider.notifier).state--;
        return false;
      }
      final bool? shouldPop = await showDialog<bool>(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Exit Employee Creation?'),
              content: const Text(
                'Are you sure you want to exit? Any unsaved data may be lost.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text(
                    'Exit',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
      );
      return shouldPop ?? false;
    }

    return WillPopScope(
      onWillPop: handleSystemBackPress,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            employeeIdToEdit == null
                ? 'Add New Employee (Step ${currentStep + 1} of $totalSteps)'
                : 'Edit Employee (Step ${currentStep + 1} of $totalSteps)',
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Previous Step / Exit',
            onPressed: () async {
              final currentStepVal = ref.read(
                currentEmployeeCreationStepProvider,
              );
              if (currentStepVal > 0) {
                // This assumes the child screen's FormStepLayout's onPrevious handles data saving.
                ref.read(currentEmployeeCreationStepProvider.notifier).state--;
              } else {
                final bool? shouldExit = await showDialog<bool>(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: const Text('Exit Employee Creation?'),
                        content: Text(
                          employeeIdToEdit == null
                              ? 'Are you sure you want to exit? All entered data will be lost.'
                              : 'Are you sure you want to exit editing? Unsaved changes may be lost.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text('Stay'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text(
                              'Exit',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                );
                if (shouldExit == true && context.mounted) {
                  if (employeeIdToEdit == null) {
                    // Only reset form if it was for a new employee
                    ref
                        .read(employeeCreationNotifierProvider.notifier)
                        .prepareNewEmployee();
                  }
                  Navigator.of(context).pop();
                }
              }
            },
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
              child: Row(
                children: List.generate(totalSteps, (index) {
                  final bool isActive = index == currentStep;
                  final bool isCompleted = index < currentStep;
                  Color indicatorColor;
                  double height = 5.0;

                  if (isActive) {
                    indicatorColor = Theme.of(context).primaryColor;
                    height = 7.0;
                  } else if (isCompleted) {
                    indicatorColor = Theme.of(
                      context,
                    ).primaryColor.withOpacity(0.5);
                  } else {
                    indicatorColor = Colors.grey.shade300;
                  }
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (isCompleted || isActive) {
                          // Ideally, child screens should save their state before this jump.
                          // This direct jump might bypass unsaved changes in the current step.
                          ref
                              .read(
                                currentEmployeeCreationStepProvider.notifier,
                              )
                              .state = index;
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        height: height,
                        decoration: BoxDecoration(
                          color: indicatorColor,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: _employeeCreationSteps,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
