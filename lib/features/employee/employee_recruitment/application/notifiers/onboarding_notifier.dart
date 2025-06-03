// lib/features/recruitment/application/onboarding_notifier.dart
import 'dart:io'; // For File if tasks involve uploads

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/enums/onboarding_task_status.dart';
import 'package:police_com/core/enums/task_assignee_type.dart';
import 'package:police_com/features/employee/employee_recruitment/application/states/onboarding_state.dart';
import 'package:police_com/features/employee/employee_recruitment/domain/onboarding_task_model.dart';

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  final AutoDisposeStateNotifierProviderRef _ref;
  final String _applicantId; // The ID of the applicant being onboarded

  // TODO: Inject actual API service for managing onboarding tasks
  // final YourOnboardingApiService _apiService;

  OnboardingNotifier(this._ref, this._applicantId /*, this._apiService*/)
    : super(OnboardingState(applicantId: _applicantId)) {
    fetchOnboardingTasks();
  }

  Future<void> fetchOnboardingTasks({bool isRefresh = false}) async {
    if (state.isLoading && !isRefresh) return;
    final link = _ref.keepAlive();
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      successMessage: null,
    );

    try {
      // --- TODO: Implement actual API call to fetch onboarding tasks for _applicantId ---
      // final fetchedTasks = await _apiService.getOnboardingTasks(_applicantId);
      // final fetchedApplicantDetails = await _apiService.getApplicantDetails(_applicantId); // Optional

      await Future.delayed(
        const Duration(milliseconds: 700),
      ); // Simulate API delay

      // Mock data generation
      final mockTasks = _generateMockOnboardingTasks(_applicantId);
      // final mockApplicantDetails = _generateMockApplicantDetails(_applicantId); // If fetching details

      state = state.copyWith(
        tasks: mockTasks,
        // applicantDetails: mockApplicantDetails,
        isLoading: false,
      );
    } catch (e) {
      debugPrint('Error fetching onboarding tasks: $e');
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load onboarding tasks: ${e.toString()}',
      );
    } finally {
      link.close();
    }
  }

  Future<void> updateTaskStatus(
    String taskId,
    OnboardingTaskStatus newStatus, {
    String? notes,
    String? remark,
  }) async {
    final link = _ref.keepAlive();
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      successMessage: null,
    );
    try {
      // --- TODO: Implement actual API call to update task status ---
      // await _apiService.updateOnboardingTaskStatus(_applicantId, taskId, newStatus, notes, remark);
      await Future.delayed(
        const Duration(milliseconds: 500),
      ); // Simulate API delay

      // Update local state
      final updatedTasks =
          state.tasks.map((task) {
            if (task.id == taskId) {
              return task.copyWith(
                status: newStatus,
                notes: notes ?? task.notes,
                checkRemark: remark ?? task.checkRemark,
                completionDate:
                    (newStatus == OnboardingTaskStatus.completed ||
                            newStatus == OnboardingTaskStatus.waived)
                        ? DateTime.now()
                        : task.completionDate,
              );
            }
            return task;
          }).toList();

      state = state.copyWith(
        tasks: updatedTasks,
        isLoading: false,
        successMessage:
            "Task '${state.tasks.firstWhere((t) => t.id == taskId).title}' updated.",
      );
    } catch (e) {
      debugPrint('Error updating task status: $e');
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to update task: ${e.toString()}',
      );
    } finally {
      link.close();
    }
  }

  Future<void> uploadDocumentForTask(String taskId, File documentFile) async {
    final link = _ref.keepAlive();
    // Find the task to show its name in messages
    final taskTitle =
        state.tasks
            .firstWhere(
              (t) => t.id == taskId,
              orElse:
                  () => const OnboardingTaskModel(
                    id: '',
                    applicantId: '',
                    title: 'Unknown Task',
                  ),
            )
            .title;
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      successMessage: null,
    );

    try {
      // --- TODO: Implement actual document upload for the task ---
      // final uploadedPath = await _apiService.uploadOnboardingDocument(_applicantId, taskId, documentFile);
      await Future.delayed(const Duration(seconds: 1)); // Simulate upload
      final mockUploadedPath =
          "onboarding_docs/$_applicantId/${taskId}_${documentFile.path.split('/').last}";

      final updatedTasks =
          state.tasks.map((task) {
            if (task.id == taskId) {
              return task.copyWith(
                uploadedDocumentPath: mockUploadedPath,
                uploadedDocumentFile: null, // Clear local file after "upload"
                status:
                    OnboardingTaskStatus
                        .inProgress, // Or 'completed' if upload is the final step
              );
            }
            return task;
          }).toList();
      state = state.copyWith(
        tasks: updatedTasks,
        isLoading: false,
        successMessage: "Document for '$taskTitle' uploaded.",
      );
    } catch (e) {
      debugPrint('Error uploading document for task $taskId: $e');
      state = state.copyWith(
        isLoading: false,
        errorMessage:
            "Failed to upload document for '$taskTitle': ${e.toString()}",
      );
    } finally {
      link.close();
    }
  }

  // Mock data generation - to be replaced by API calls
  List<OnboardingTaskModel> _generateMockOnboardingTasks(String applicantId) {
    return [
      OnboardingTaskModel(
        id: 'task_001_$applicantId',
        applicantId: applicantId,
        title: 'Submit Signed Offer Letter',
        assignedTo: TaskAssigneeType.newHire,
        dueDate: DateTime.now().add(const Duration(days: 2)),
        requiredDocumentName: 'Signed Offer Letter.pdf',
      ),
      OnboardingTaskModel(
        id: 'task_002_$applicantId',
        applicantId: applicantId,
        title: 'Complete Background Check',
        status: OnboardingTaskStatus.inProgress,
        isChecklistItem: true,
      ),
      OnboardingTaskModel(
        id: 'task_003_$applicantId',
        applicantId: applicantId,
        title: 'Provide Bank Account Details',
        assignedTo: TaskAssigneeType.newHire,
        dueDate: DateTime.now().add(const Duration(days: 3)),
        requiredDocumentName: 'Bank Details Form.pdf',
      ),
      OnboardingTaskModel(
        id: 'task_004_$applicantId',
        applicantId: applicantId,
        title: 'Medical Examination',
        isChecklistItem: true,
      ),
      OnboardingTaskModel(
        id: 'task_005_$applicantId',
        applicantId: applicantId,
        title: 'Attend Orientation Session',
        assignedTo: TaskAssigneeType.newHire,
        dueDate: DateTime.now().add(const Duration(days: 7)),
        description:
            'Mandatory orientation on police code of conduct and procedures.',
      ),
      OnboardingTaskModel(
        id: 'task_006_$applicantId',
        applicantId: applicantId,
        title: 'Collect Uniform and Equipment',
      ),
      OnboardingTaskModel(
        id: 'task_007_$applicantId',
        applicantId: applicantId,
        title: 'Setup System Access & Email',
        assignedTo: TaskAssigneeType.system,
        status: OnboardingTaskStatus.completed,
        completionDate: DateTime.now().subtract(const Duration(hours: 1)),
        isChecklistItem: true,
        checkRemark: 'Automated account creation successful.',
      ),
      OnboardingTaskModel(
        id: 'task_008_$applicantId',
        applicantId: applicantId,
        title: 'Reference Check Verification',
        isChecklistItem: true,
      ),
    ];
  }

  // Optional: Mock for applicant details if needed on the onboarding screen
  // ApplicantApplyModel _generateMockApplicantDetails(String applicantId) {
  //   return ApplicantApplyModel(
  //       applicantId: int.tryParse(applicantId.replaceAll(RegExp(r'[^0-9]'),'')) ?? 0, // Extract number from ID
  //       appliedToVacancyId: 'VAC_MOCK_ONBOARD',
  //       firstName: 'New',
  //       lastName: 'Recruit $applicantId',
  //       email: '${applicantId.toLowerCase()}@example-police.com',
  //       phoneNumber: '0900000000',
  //       dateOfBirth: DateTime(1995,1,1),
  //       gender: Gender.female,
  //       address: 'Police Training Academy',
  //       nationality: 'Ethiopian',
  //       status: RecruitmentStatus.hired
  //   );
  // }
}
