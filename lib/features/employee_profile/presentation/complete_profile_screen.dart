import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/features/employee_profile/presentation/academic_qualification/academic_qualifications_screen.dart';
import 'package:police_com/features/employee_profile/presentation/general_documents/general_documents_screen.dart';
import 'package:police_com/features/employee_profile/presentation/personal_info_screen.dart';
import 'package:police_com/features/employee_profile/presentation/review_registration/review_registration_screen.dart';
import 'package:police_com/features/employee_profile/presentation/work_experience/work_experience_screen.dart';

// Optional: A provider for the PageController if you need to access it from children
// or want to manage its lifecycle more explicitly with Riverpod.
// final registrationPageControllerProvider = Provider.autoDispose<PageController>((ref) {
//   final pageController = PageController();
//   ref.onDispose(() => pageController.dispose());
//   return pageController;
// });

// Provider to manage the current step index
final currentRegistrationStepProvider = StateProvider.autoDispose<int>(
  (ref) => 0,
);

/// No need to import registrationNotifierProvider directly here if children handle their data saving.

class CompleteProfileScreen extends HookConsumerWidget {
  const CompleteProfileScreen({super.key});

  // Define the steps. This could also be fetched from a config or a dedicated provider
  // if steps become dynamic or need more metadata (e.g., titles for the indicator).
  static final List<Widget> _registrationStepScreens = [
    const PersonalInfoScreen(),
    const AcademicQualificationsScreen(),
    const WorkExperienceScreen(),
    const GeneralDocumentsScreen(),
    const ReviewRegistrationScreen(),
  ];

  static int get totalSteps => _registrationStepScreens.length;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final currentStep = ref.watch(currentRegistrationStepProvider);

    // --- Two-way Synchronization between PageController and currentRegistrationStepProvider ---

    // Effect 1: Animate PageView when currentRegistrationStepProvider changes
    // This is triggered when child screens update the provider (e.g., on "Next" or "Previous")
    // or when an "Edit" button on the Review screen jumps to a specific step.
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (pageController.hasClients &&
            pageController.page?.round() != currentStep) {
          pageController.animateToPage(
            currentStep,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeOutCubic, // Smoother curve
          );
        }
      });
      return null;
    }, [currentStep]); // Reacts to external changes of currentStep

    // Effect 2: Update currentRegistrationStepProvider if PageView is swiped
    // (Only relevant if physics is not NeverScrollableScrollPhysics)
    useEffect(() {
      void pageListener() {
        final pageFromController = pageController.page?.round();
        if (pageFromController != null &&
            pageFromController != ref.read(currentRegistrationStepProvider)) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Check if the widget is still mounted before updating state from listener
            if (context.mounted) {
              ref.read(currentRegistrationStepProvider.notifier).state =
                  pageFromController;
            }
          });
        }
      }

      pageController.addListener(pageListener);
      return () => pageController.removeListener(pageListener);
    }, [pageController]);

    Future<bool> handleSystemBackPress() async {
      if (currentStep > 0) {
        // Child screens should ideally save any draft data before this triggers if needed,
        // but this back press usually implies canceling the current edit or going back.
        ref.read(currentRegistrationStepProvider.notifier).state--;
        return false; // Prevent app from closing / popping the route
      }
      return true; // Allow app to close or pop the route if on the first step
    }

    return WillPopScope(
      onWillPop: handleSystemBackPress,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Complete Profile (Step ${currentStep + 1} of $totalSteps)',
          ),
          leading:
              currentStep > 0
                  ? IconButton(
                    icon: const Icon(Icons.arrow_back),
                    tooltip: 'Previous Step',
                    onPressed: () {
                      // Child screens are expected to save their data to registrationNotifierProvider
                      // when their *own* internal "Previous" button is pressed *before* this state changes.
                      // This AppBar button is a more direct navigation.
                      ref
                          .read(currentRegistrationStepProvider.notifier)
                          .state--;
                    },
                  )
                  : null, // No AppBar back button on the first step (or allow default pop)
        ),
        body: Column(
          children: [
            // --- Enhanced Step Indicator ---
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              child: Row(
                children: List.generate(totalSteps, (index) {
                  final bool isActive = index == currentStep;
                  final bool isCompleted = index < currentStep;
                  Color indicatorColor;
                  double height = 6.0;

                  if (isActive) {
                    indicatorColor = Theme.of(context).primaryColor;
                    height = 8.0; // Make active step slightly taller
                  } else if (isCompleted) {
                    indicatorColor = Theme.of(
                      context,
                    ).primaryColor.withOpacity(0.6);
                  } else {
                    indicatorColor = Colors.grey.shade300;
                  }

                  return Expanded(
                    child: InkWell(
                      // Allow tapping on completed steps to navigate back
                      onTap:
                          isCompleted
                              ? () {
                                ref
                                    .read(
                                      currentRegistrationStepProvider.notifier,
                                    )
                                    .state = index;
                              }
                              : null,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        height: height,
                        decoration: BoxDecoration(
                          color: indicatorColor,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        // child: if you want numbers or icons in the indicator
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
                children: _registrationStepScreens,
              ),
            ),
          ],
        ),
        // General "Next" / "Previous" buttons at the bottom are removed.
        // Each step screen's FormStepLayout (or equivalent) is responsible for its own
        // "Next" / "Previous" action buttons which will:
        // 1. Validate & Save data of that step (to registrationNotifierProvider)
        // 2. Update currentRegistrationStepProvider.notifier.state
        // The ReviewRegistrationScreen will have its own "Submit" button.
      ),
    );
  }
}
