import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/features/employee_profile/application/add_new_employee_step_provider.dart';
import 'package:police_com/features/employee_profile/application/employee_creation_provider.dart';

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
  static final List<Widget> _employeeCreationSteps = [
    const EmployeeCoreInfoScreen(),
    const EmployeeContactsScreen(),
    const EmployeeDependantsScreen(),
    const EmployeeEducationScreen(),
    const EmployeeExperienceScreen(),
    const EmployeeSpouseInfoScreen(),
    const EmployeeGeneralDocumentsScreen(),
    const EmployeePerformanceListScreen(), // This step could be conditionally added
    const ReviewAndSubmitScreen(),
    // RegistrationSuccessScreen is navigated to *after* this flow completes successfully.
  ];

  static int get totalSteps => _employeeCreationSteps.length;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController(
      initialPage: ref.read(currentEmployeeCreationStepProvider),
    );
    final currentStep = ref.watch(currentEmployeeCreationStepProvider);

    // Effect to prepare a new employee form when the screen is first built
    // or to load an existing employee if employeeIdToEdit is provided.
    useEffect(() {
      if (employeeIdToEdit != null) {
        // TODO: Implement logic to fetch and load existing employee data
        // ref.read(employeeCreationNotifierProvider.notifier).loadEmployeeForEditing(employeeIdToEdit!);
        print(
          'Host Screen: Editing mode for employee ID $employeeIdToEdit (TODO: implement load)',
        );
      } else {
        // Prepare a fresh form for a new employee
        // This ensures if the user comes back to this screen, the form is reset.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref
              .read(employeeCreationNotifierProvider.notifier)
              .prepareNewEmployee();
          // Ensure the PageView and step provider are also reset to the first page
          // if this screen is re-entered for a completely new employee.
          if (ref.read(currentEmployeeCreationStepProvider) != 0) {
            ref.read(currentEmployeeCreationStepProvider.notifier).state = 0;
          }
          if (pageController.hasClients && pageController.page != 0) {
            pageController.jumpToPage(0);
          }
        });
      }
      return null; // No cleanup needed for this effect
    }, const [],); // Empty dependency array means it runs once on mount

    // --- Two-way Synchronization for PageController and Provider ---
    // 1. Animate PageView when currentEmployeeCreationStepProvider changes
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (pageController.hasClients &&
            pageController.page?.round() != currentStep) {
          pageController.animateToPage(
            currentStep,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
          );
        }
      });
      return null;
    }, [currentStep],); // React to provider changes

    // 2. Update provider if PageView is somehow changed directly (e.g., by swiping if enabled)
    useEffect(() {
      void pageListener() {
        final pageFromController = pageController.page?.round();
        if (pageFromController != null &&
            pageFromController !=
                ref.read(currentEmployeeCreationStepProvider)) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              // Ensure widget is still in the tree
              ref.read(currentEmployeeCreationStepProvider.notifier).state =
                  pageFromController;
            }
          });
        }
      }

      pageController.addListener(pageListener);
      return () => pageController.removeListener(pageListener);
    }, [pageController],);

    Future<bool> handleSystemBackPress() async {
      final currentStepVal = ref.read(currentEmployeeCreationStepProvider);
      if (currentStepVal > 0) {
        ref.read(currentEmployeeCreationStepProvider.notifier).state--;
        return false; // Prevent default pop, we handled navigation
      }
      // If on the first step, allow default pop (which might exit this screen)
      // Or show a confirmation dialog:
      final bool? shouldPop = await showDialog<bool>(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Exit Employee Creation?'),
              content: const Text(
                'Are you sure you want to exit? Any unsaved progress on the current step might be lost.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Exit'),
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
            'Add New Employee (Step ${currentStep + 1} of $totalSteps)',
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.close_rounded,
            ), // Changed to close for exiting flow
            tooltip: 'Cancel Employee Creation',
            onPressed: () async {
              // Ask for confirmation before exiting
              final bool? shouldExit = await showDialog<bool>(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: const Text('Cancel Employee Creation?'),
                      content: const Text(
                        'Are you sure you want to cancel? All entered data will be lost.',
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
                ref
                    .read(employeeCreationNotifierProvider.notifier)
                    .prepareNewEmployee();
                // Navigator.of(context).pop();
              }
            },
          ),
        ),
        body: Column(
          children: [
            // --- Step Indicator ---
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
                      // Allow tapping on step indicator (optional)
                      onTap: () {
                        // Allow navigation to previous completed steps or current step
                        // Might want to prevent jumping far ahead if steps are dependent
                        if (isCompleted || isActive) {
                          // Note: Ensure current step data is saved by child screen's onNext/onPrevious
                          // before allowing arbitrary jumps via indicator. This simplified tap
                          // directly changes the step without intermediate save.
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
            // --- PageView for Steps ---
            Expanded(
              child: PageView(
                controller: pageController,
                physics:
                    const NeverScrollableScrollPhysics(), // Disable manual swiping
                children: _employeeCreationSteps,
              ),
            ),
          ],
        ),
        // Bottom navigation buttons are now handled within each step's FormStepLayout
      ),
    );
  }
}
